require_relative './data_values'

class App
  attr_accessor :book_list, :people

  def initialize
    @book_list = DataValues.books
    @people = DataValues.people
    @students = DataValues.students
    @teachers = DataValues.teachers
    @rentals = DataValues.rentals
  end

  def run
    user_input
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

  def list_all_people
    puts "People's list:\n\n"
    if @people.empty?
      puts 'Please ADD some people...'
    else
      @people.each_with_index do |person, index|
        if person.instance_of?(Student)
          print "\n#{index}) [Student]
          Name: #{person.name}, ID: #{person.id}, Age: #{person.age}, Classroom: #{person.classroom.label}\n"
        else
          print "\n#{index}) [Teacher]
          Name: #{person.name}, ID: #{person.id}, Age: #{person.age}, Especialization: #{person.specialization}\n"
        end
      end
    end
  end

  def list_all_students
    if @students.empty?
      puts 'Please ADD some students...'
    else
      puts 'STUDENTS: '
      @students.each do |student|
        puts "ID: #{student.id}, Name: #{student.name}, Age: #{student.age}, Classroom: #{student.classroom.label}"
      end
    end
  end

  def list_all_teachers
    if @teachers.empty?
      puts 'Please ADD some teachers...'
    else
      puts 'TEACHERS: '
      @teachers.each do |teacher|
        puts "ID: #{teacher.id}, Name: #{teacher.name}, Age: #{teacher.age}"
      end
    end
  end

  def list_rentals_by_id
    list_all_people
    print "Enter a person's ID: "
    person_id = gets.chomp.to_i
    puts "Rentals list:\n\n"
    if @rentals.empty?
      puts 'Please ADD some rentals...'
    else
      puts 'RENTALS.'
      @rentals.select do |rental|
        puts "Book: #{rental.book.title} by: #{rental.book.author} on #{rental.date} " if rental.person.id == person_id
      end
    end
  end
end
