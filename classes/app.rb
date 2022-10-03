require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'

class App
  attr_accessor :book_list, :people

  def initialize
    @book_list = []
    @people = []
    @students = []
    @teachers = []
    @rentals = []
  end

  def run
    user_input
  end

  def create_book
    puts 'Enter BOOK Title:'
    title = gets.chomp
    puts 'Enter BOOK Author:'
    author = gets.chomp
    book = Book.new(title, author)
    puts "The book '#{title.upcase}' by #{author.upcase} was created successfully!"
    @book_list << book unless @book_list.include?(book)
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

  def list_all_books
    if @book_list.empty?
      puts 'Please ADD some books...'
    else
      puts "BOOKS:\n"
      @book_list.each_with_index do |book, index|
        puts "#{index}) Title: '#{book.title}', Author: '#{book.author}'"
      end
    end
  end


end
