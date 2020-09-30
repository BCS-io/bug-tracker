class Issue < ApplicationRecord
  belongs_to :project
  belongs_to :account

  enum work: {bug: 0, improvement: 1, task: 2, new_feature: 3, epic: 4}, _prefix: :work
  enum status: {open: 0, closed: 1}, _prefix: :status

  validates :summary, :work, :status, presence: true
  validates :status, inclusion: {in: statuses.keys}
  validates :work, inclusion: {in: works.keys}

  scope :created_desc, -> { order(created_at: :desc) }
end
