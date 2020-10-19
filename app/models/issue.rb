class Issue < ApplicationRecord
  belongs_to :project
  belongs_to :account
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :events, class_name: "Issues::Event", dependent: :destroy
  accepts_nested_attributes_for :comments

  enum work: {bug: 0, improvement: 1, task: 2, new_feature: 3, epic: 4}, _prefix: :work
  enum status: {open: 0, closed: 1}, _prefix: :status

  validates :summary, :work, :status, presence: true
  validates :status, inclusion: {in: statuses.keys}
  validates :work, inclusion: {in: works.keys}

  scope :query, ->(query) {
    query = sanitize_sql_like(query)
    where("summary ILIKE ?", "%" + query + "%")
  }
  scope :created_desc, -> { order(created_at: :desc) }
end
