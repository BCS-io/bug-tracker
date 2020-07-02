class PagesPolicy < Struct.new(:account, :page)
  def home?
    true
  end
end
