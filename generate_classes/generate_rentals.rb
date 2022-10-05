require_relative '../template_classes/rental'
require_relative '../data_values'
require_relative '../app'

class GenerateRentals
  include DataValues
  attr_reader :people_generator, :books_generator

  def initialize
    @people = DataValues.people
    @book_list = DataValues.books
    @rentals = DataValues.rentals
  end

  def create_rental
    if @book_list.empty?
      puts 'Please ADD some books...'
    elsif @people.empty?
      puts 'Please ADD some people...'
    else
      puts "Select a book from the following list by number:\n"
      new_app = App.new
      new_app.list_all_books
      index_of_book = gets.chomp.to_i
      puts "Select a person from the following list by number:\n"
      new_app.list_all_people
      index_of_person = gets.chomp.to_i
      rental = Rental.new(@people[index_of_person], @book_list[index_of_book])
      puts "Rental of #{@book_list[index_of_book].title} by #{@people[index_of_person].name} was Successfully Created!"
      @rentals << rental unless @rentals.include?(rental)
    end
  end
end
