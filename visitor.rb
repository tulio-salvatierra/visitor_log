class Visitor
  attr_reader :id, :name, :purpose, :timestamp

  def initialize(name, purpose)
    @id = generate_id
    @name = name
    @purpose = purpose
    @timestamp = Time.now
  end

  private

  def generate_id
    rand(1000..9999)
  end
end
