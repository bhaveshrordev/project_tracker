class Project < ApplicationRecord
  enum status: { pending: 0, in_progress: 1, completed: 2, archived: 3 }

  belongs_to :user
  has_many :activities, dependent: :destroy

  validates :name, presence: true

  after_create :log_initial_status
  after_update :log_status_change, if: :saved_change_to_status?

  private

  def log_initial_status
    log_status_activity
  end

  def log_status_change
    log_status_activity
  end

  def log_status_activity
    activities.create!(
      kind: "status_change",
      content: status,
      user: user
    )
  end
end
