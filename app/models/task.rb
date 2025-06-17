class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

  enum :status, { pending: 0, in_progress: 1, completed: 2 }

  validates :name, presence: true
  validates :status, presence: true

  def status_badge
    case status
    when "pending"
      "badge bg-warning"
    when "in_progress"
      "badge bg-primary"
    when "completed"
      "badge bg-success"
    end
  end
end
