require 'date'

class Rental
  attr_accessor :date, :book, :person

  def initialize(person, book)
    @date = DateTime.now
    @person = person
    @book = book
    @person.rentals << self
    @book.rentals << self
  end
end
