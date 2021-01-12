class Question < ApplicationRecord
  belongs_to :group
  has_many :answers, dependent: :destroy
  has_many :users, through: :answers
end
