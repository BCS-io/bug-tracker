class Project < ApplicationRecord
  belongs_to :lead, class_name: "Account"

  scope :search, ->(query) {
    query = sanitize_sql_like(query)
    where(arel_table[:name].matches("%#{query}%"))
      .or(where(arel_table[:key].matches("%#{query}%")))
  }
end
