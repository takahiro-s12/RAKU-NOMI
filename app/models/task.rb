class Task < ApplicationRecord
  belongs_to :user

  validates :task, presence: true, length: { maximum: 15 }

end
