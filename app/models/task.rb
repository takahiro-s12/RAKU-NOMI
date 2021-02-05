class Task < ApplicationRecord
  belongs_to :user

  validates :task, presence: true, length: { maximum: 15 }
  validates :limit_date, presence: true
end
