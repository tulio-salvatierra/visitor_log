require_relative 'visitor'

class Visits
  def initialize
    @visitor_log = []
  end

  def start
    show_welcome_message
    loop do
      show_menu
      choice = gets.chomp.to_i

      case choice
      when 1
        record_visit
      when 2
        check_visit
      when 3
        view_recorded
      when 4
        puts 'Exiting the loop. Goodbye!'
        break
      else
        puts 'Invalid option. Please choose a valid option.'
      end
    end
  end

  def show_welcome_message
    puts "\n=== Welcome to Visitor Logger ==="
    puts "Track your visitors easily!"
    puts "================================"
  end

  def show_menu
    puts "\nVisitor log:"
    puts '1. Record a visit'
    puts '2. Lookup a visit'
    puts '3. View Visit Log'
    puts '4. Exit Log'
    print "\nEnter your choice: "
  end

  def record_visit
    print "\nEnter visitor name: "
    name = gets.chomp
    
    print "Enter visit purpose: "
    purpose = gets.chomp
    
    visitor = Visitor.new(name, purpose)
    @visitor_log.push(visitor)
    
    puts "\nVisit recorded successfully!"
    puts "Visitor ID: #{visitor.id}"
    puts "Time: #{visitor.timestamp.strftime('%Y-%m-%d %H:%M:%S')}"
  end

  def check_visit
    print "\nEnter visitor ID to look up: "
    search_id = gets.chomp.to_i
    
    visitor = @visitor_log.find { |v| v.id == search_id }
    
    if visitor
      display_visitor(visitor)
    else
      puts "\nNo visitor found with ID: #{search_id}"
    end
  end

  def view_recorded
    if @visitor_log.empty?
      puts "\nNo visits recorded yet."
    else
      puts "\n=== Visitor Log ==="
      @visitor_log.each do |visitor|
        display_visitor(visitor)
        puts "-" * 40
      end
    end
  end

  private

  def display_visitor(visitor)
    puts "\nID: #{visitor.id}"
    puts "Name: #{visitor.name}"
    puts "Purpose: #{visitor.purpose}"
    puts "Time: #{visitor.timestamp.strftime('%Y-%m-%d %H:%M:%S')}"
  end
end
