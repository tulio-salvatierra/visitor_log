class VisitLog
  attr_reader :logs

  def initialize
    @logs = []
  end

  def add_visit(visitor)
    @logs << visitor
    puts "\nV isit logged succesfully!"
  end

  def find_visit(id)
    @logs.find { |visit| visit.id == id}
  end

  def all_visits
    @logs
  end
end
