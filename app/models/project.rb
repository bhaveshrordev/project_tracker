class Project < ApplicationRecord
  enum status: { pending: 0, in_progress: 1, completed: 2, archived: 3 }

  belongs_to :user
  has_many :activities, dependent: :destroy

  validates :name, presence: true

  after_create :log_creation_activity
  after_update :log_status_change_activity

  private

  def log_creation_activity
    activities.create!(
      kind: "status_change",
      content: status,
      user: user
    )
  end

  def log_status_change_activity
    if saved_change_to_status?
      activities.create!(
        kind: "status_change",
        content: status,
        user: user
      )
    end
  end
end

  