require './app'

class Main
  def initialize
    @app = App.new
  end

def main
  puts "\nWelcome to OOP School Library App!!\n\n"
  puts('')
  print_menu
end

def print_menu # rubocop:disable Metrics/CyclomaticComplexity
  loop do
    puts "\nPlease choose an option by entering a number:\n"
    puts '1- List all Books.'
    puts '2- List all People.'
    puts '3- Create a Person.'
    puts '4- Create a Book.'
    puts '5- Create a Rental.'
    puts '6- List all rentals for a given person id.'
    puts '7- Exit'
    input = user_input
    case input
    when 1 then @app.list_books
    when 2 then @app.list_people
    when 3 then @app.create_person
    when 4 then @app.create_book
    when 5 then @app.create_rental
    when 6 then @app.list_rentals
    else break
    end
    break unless input.positive? && input < 8
  end
end

def user_input
  input = gets.chomp.to_i
  while input > 7 || input < 1
    puts 'Invalid option entered '
    input = gets.chomp.to_i
  end
  input
end
end

main = Main.new
main.main
