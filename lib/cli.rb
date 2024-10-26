class CLI 
  def initialize
    @visit_log = VisitLog.new
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
        find_visit
      when 3
        show_all_visits
      when 4
        puts "\nInvalid option. Please try again."
      end
    end
  end

  private

  def show_welcome_message
    puts "\n Welcome to Visitor Logger"
    puts "Track your visitors easily!"
    puts "============================"
  end

  def show_menu
    puts "\nVisitor log:"
    puts '1. Record a visit'
    puts '2. Find a visit'
    puts '3. View all visits'
    puts '4. Exit'
    print "\nEnter your choice: "
  end

  def record_visit 
    print "\nEnter visitor name: "
    name = gets.chomp

    print "\nEnter visit purpose: "
    purpose = gets.chomp

    visitor = Visitor.new(name, purpose)
    @visit_log.add_visit(visitor)
    display_visitor(visitor)
  end

  def find_visit
    print "/nEnter visitor ID: "
    id = gets.chomp.to_i

    visitor = @visit_log.find_visit(id)
    if visitor
      display_visitor(visitor)
    else
      puts "\nNo visitor found with ID: #{id}"
    end 
  end

  def show_all_visits
    visits = @visit_log.all_visits

    if visits.empty?
      puts "\nNo visits recorded yet."
    else 
      puts "\n=== All Visits ==="
      visits.each do |visitor|
        display_visitor(visitor)
        puts "-" * 40
      end
    end
  end

  def display_visitor(visitor)
    puts "\nVisitor Details:"
    puts "\nID: #{visitor.id}"
    puts "\nName: #{visitor.name}"
    puts "\nPurpose: #{visitor.purpose}" 
    puts "\nTime: #{visitor.timestamp.strftime('%Y-%m-%d %H:%M:%S')}"
  end
end
