require 'minitest/autorun'
require_relative '../lib/visitor'
require_relative '../lib/visit_log'

class VisitorSysrtemTest < Minitest::Test
  def setup
    @visit_log = VisitLog.new
  end

  def test_can_create_visitor
    visitor = Visitor.new("Tulio Cesar", "Pick up")
    assert_equal "Tulio Cesar", visitor.name
    assert_equal "Pick up", visitor.purpose
  end

  def test_can_log_visit
    visitor = Visitor.new("Tulio Cesar", "Job Interview")
    @visit_log.add_visit(visitor)
    assert_equal 1, @visit_log.logs.length
  end

  def test_can_find_visit
    visitor = Visitor.new("Tulio Cesar", "Devlivery")
    @visit_log.add_visit(visitor)
    found_visit = @visit_log.find_visit(visitor.id)
    assert_equal visitor, found_visit
  end
end   
