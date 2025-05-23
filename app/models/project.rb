class Project < ApplicationRecord
  enum status: { pending: 0, in_progress: 1, completed: 2, archived: 3 }

  has_many :activities, dependent: :destroy
end