class Task < ApplicationRecord

  belongs_to :user
  validates :status, :name, :description, :user_id, :due_at, :priority, presence: true
  enum status: [:pending, :doing, :done]
  enum priority: [:low, :high, :urgent]

end
