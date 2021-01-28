# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  accepts_nested_attributes_for :group_users
  has_many :event_users, dependent: :destroy
  has_many :events, through: :event_users
  has_many :active_notifications, class_name: "Notification",
                                  foreign_key: "visiter_id",
                                  dependent: :destroy
  has_many :passive_notifications, class_name: "Notification",
                                   foreign_key: "visited_id",
                                   dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :usesrs, through: :answers
  has_many :tasks, dependent: :destroy

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :nickname, presence: true, length: { in: 1..10 }
  validates :email, presence: true
  validates :favorite_food, length: { maximum: 10 }
  validates :favorite_drink, length: { maximum: 10 }
  validates :hated_food, length: { maximum: 10 }

  generate_public_uid
  attachment :image

  # public_uidが該当するユーザーを検索
  def self.search_for(content)
    User.where(public_uid: content)
  end

  # ユーザーをフォロー
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # フォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローの確認
  def following?(user)
    following_user.include?(user)
  end

  def create_notification_follow!(current_user)
    temp = Notification.where([
      "visiter_id = ? and visited_id = ? and action = ?",
      current_user.id,
      id,
      'follow',
    ])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
end
