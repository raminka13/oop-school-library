require './book'
require './data_values'

class GenerateBooks
  include DataValues

  def initialize
    @books = DataValues.books
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def list_books
    if @books.length.zero?
      puts 'There are no books, Please add a book first'
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1} - Book title: #{book.title}, Book author: #{book.author}"
      end
    end
  end
end
