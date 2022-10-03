require './generate_books'
require './generate_people'
require './generate_rentals'

class App
  attr_reader :books_class, :people_class, :rentals_class

  def initialize
    @books_class = GenerateBooks.new
    @people_class = GeneratePeople.new
    @rentals_class = GenerateRentals.new
  end
end
