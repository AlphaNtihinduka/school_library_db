require './book'
require './classroom'
require './person'
require './rental'
require './student'
require './teacher'

class App
  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts 'The Library book is empty'
    else
      puts 'List of all books'
      @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    end
  end

  def list_people
    if @books.empty?
      puts 'There are no people in the list'
    else
      puts 'List of all people'
      @persons.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
  end

  def create_person
    puts 'Do you what to create a student(1) or a teacher(2)?'
    puts '1- Student'
    puts '2- Teacher'
    print 'Enter selection: '
    person_type = gets.chomp.to_i
    case person_type
    when 1 then create_student
    when 2 then create_teacher
    end
  end

  def create_student
    print 'Name: '
    name = gets.chomp
    print 'Age : '
    age = gets.chomp.to_i
    print 'Has parent permission? [Y/N]: '
    permission = gets[0]
    permission = (permission == ('Y' || 'y'))
    @persons << Student.new('Unknown', name, age, parent_permission: permission)
    puts "Person created successfully \n"
  end

  def create_teacher
    print 'Name: '
    name = gets.chomp
    print 'Age : '
    age = gets.chomp.to_i
    print 'Specialization: '
    specialization = gets.chomp
    @persons << Teacher.new(specialization, age, name)
    puts "Person created successfully\n"
  end

  def create_book
    puts 'Create a book'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts "Book created successfully\n"
  end

  def create_rental
    puts 'Create rental'
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}. Title: \"#{book.title}\", Author: #{book.author}" }
    book_number = gets.chomp.to_i
    puts 'Select a Person from the following list by number'
    @persons.each_with_index do |person, index|
      puts " #{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_number = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, @books[book_number], @persons[person_number])
    puts "Rental created successfully \n\n"
  end

  def list_rentals
    puts 'List all rentals'
    print 'Enter ID of person: '
    person_id = gets.chomp
    puts 'Rentals : '
    @rentals.each do |rental|
      if rental.person.id.to_s == person_id.to_s
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by: #{rental.person.name}"
      end
    end
  end
end
