require_relative '../data_values'
require 'json'

class Dataset
  attr_accessor :book_list, :people

  def initialize
    @book_list = DataValues.books
    @people = DataValues.people
    @students = DataValues.students
    @teachers = DataValues.teachers
    @rentals = DataValues.rentals
  end

  def load_data
    load_books
    load_people
    load_rentals
  end

  def load_books
    if File.exist?('./data_preserve/books.json')
      books_data = JSON.parse(File.read('./data_preserve/books.json'), create_additions: true)
      books_data.each do |bk|
        book = Book.new(bk['title'], bk['author'])
        @book_list << book
      end
    else
      []
    end
  end

  def load_people
    if File.exist?('./data_preserve/people.json')
      people_data = JSON.parse(File.read('./data_preserve/people.json'), create_additions: true)
      people_data.each do |person|
        case person['json_class']
        when 'Student'
          croom = Classroom.new(person['classroom'])
          student = Student.new(person['age'], croom, person['name'], person['parent_permission'])
          student.id = person['id']
          @people << student
          @students << student
        when 'Teacher'
          teacher = Teacher.new(person['age'], person['specialization'], person['name'], person['parent_permission'])
          teacher.id = person['id']
          @people << teacher
          @teachers << teacher
        end
      end
    else
      []
    end
  end

  def load_rentals
    if File.exist?('./data_preserve/rentals.json')
      rentals_data = JSON.parse(File.read('./data_preserve/rentals.json'), create_additions: true)
      rentals_data.map do |rentals|
        person = @people.find { |people| people.id == rentals['id_people'] }
        book = @book_list.find { |books| books.title == rentals['book_title'] }
        rent = Rental.new(person, book)
        rent.date = rentals['date']
        @rentals << rent
      end
    else
      []
    end
  end

  def save_files
    File.write('./data_preserve/books.json', JSON.pretty_generate(@book_list))
    File.write('./data_preserve/people.json', JSON.pretty_generate(@people))
    File.write('./data_preserve/rentals.json', JSON.pretty_generate(@rentals))
  end
end
