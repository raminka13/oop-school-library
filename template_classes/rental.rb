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

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'date' => @date,
      'book_title' => @book.title,
      'id_people' => @person.id
    }.to_json(*args)
  end
end
