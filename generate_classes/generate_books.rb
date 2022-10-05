require_relative '../template_classes/book'
require_relative '../data_values'

class GenerateBooks
  include DataValues

  def initialize
    @book_list = DataValues.books
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
end
