require './rental'
require './data_values'

class GenerateRentals
  include DataValues
  attr_reader :people_generator, :books_generator

  def initialize
    @persons = DataValues.persons
    @books = DataValues.books
    @people_generator = GeneratePeople.new
    @books_generator = GenerateBooks.new
  end

  def person_object(id)
    @persons.each do |person|
      return person if person.id == id
    end
    nil
  end

  def create_rental
    if @book_list.empty?
      puts 'Please ADD some books...'
    elsif @people.empty?
      puts 'Please ADD some people...'
    else
      puts "Select a book from the following list by number:\n"
      list_all_books
      index_of_book = gets.chomp.to_i
      puts "Select a person from the following list by number:\n"
      list_all_people
      index_of_person = gets.chomp.to_i
      rental = Rental.new(people[index_of_person], book_list[index_of_book])
      puts 'Rental was Successfully Created!'
      @rentals << rental unless @rentals.include?(rental)
    end
  end

  def list_rentals_by_id
    list_all_people
    print "Enter a person's ID: "
    person_id = gets.chomp.to_i
    puts "Rentals list:\n\n"
    if @rentals.empty?
      puts 'Plesae ADD some rentals...'
    else
      @rentals.select do |rental|
        if rental.person.id == person_id
          puts "#{rental.person.name} Rentals. Book: #{rental.book.title} by: #{rental.book.author} on #{rental.date} "
        end
      end
    end
  end