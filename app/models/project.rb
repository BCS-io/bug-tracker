class Project < ApplicationRecord
  belongs_to :lead, class_name: "Account"

  validates :name, length: {minimum: 3}, uniqueness: true
  validates :key, length: {minimum: 2}, uniqueness: true

  scope :search, ->(query) {
    query = sanitize_sql_like(query)
    where(arel_table[:name].matches("%#{query}%"))
      .or(where(arel_table[:key].matches("%#{query}%")))
  }
end
