class Question < ApplicationRecord
  belongs_to :group
  has_many :answers, dependent: :destroy
end
