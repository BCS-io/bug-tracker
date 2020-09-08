class ProjectSearch < ApplicationRecord
  self.primary_key = "id"
  scope :query, ->(query) {
    query = sanitize_sql_like(query)
    where("name ILIKE ?", "%" + query + "%")
      .or(where("key ILIKE ?", "%" + query + "%"))
      .or(where("username ILIKE ?", "%" + query + "%"))
  }

  def readonly?
    true
  end
end
