class rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = Book
    person.add_rental(self)
    book.add_rental(self)
  end
end