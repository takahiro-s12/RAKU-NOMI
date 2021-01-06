class Group < ApplicationRecord

  has_many :memberships, dependent: :destroy
  has_many :users, :through => :memberships
  accepts_nested_attributes_for :memberships
end
