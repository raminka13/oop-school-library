require 'date'

class Rental
  attr_accessor :date, :book, :person

  def initialize(person, book)
    @date = DateTime.now.strftime('%m/%d/%Y')
    @person = person
    @book = book
    @person.rentals << self
    @book.rentals << self
  end
end
