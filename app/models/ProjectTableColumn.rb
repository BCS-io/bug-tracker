class ProjectTableColumn
  PROJECT_COLUMNS = {"name" => "name",
                     "key" => "key",
                     "lead" => "username"}

  def initialize(column)
    @column = column
  end

  def safe_table_column
    PROJECT_COLUMNS.key?(column) ? column : "name"
  end

  def db_column
    PROJECT_COLUMNS[column]
  end

  def ==(other)
    column == other.column
  end

  attr_reader :column
end
