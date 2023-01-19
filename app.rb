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
    puts "People's list:"
    if @people.empty?
      puts 'Please ADD some people...'
    else
      @people.each_with_index do |person, index|
        puts "\n#{index} #{person.class.name.upcase}, ID: #{person.id}, Name: #{person.name},"
        puts "Age: #{person.age}, Classroom: #{person.classroom.label}\n" if person.instance_of?(Student)
        puts "Age: #{person.age}, Specialization: #{person.specialization}\n" if person.instance_of?(Teacher)
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

  def list_rentals
    puts '\nShow all rentals (Type 1) or a show rentals by ID (Type 2)?'
    num = gets.chomp.to_i
    case num
    when 1
      list_all_rentals
    when 2
      list_rentals_by_id
    end
  end

  def list_all_rentals
    if @rentals.empty?
      puts 'Please ADD some rentals...'
    else
      puts "RENTALS:\n"
      @rentals.each_with_index do |rental, index|
        puts "#{index} #{rental.person.name}: '#{rental.book.title}' By #{rental.book.author} on #{rental.date}"
      end
    end
  end

  def list_rentals_by_id
    @people.each do |person|
      puts "\nNAME: #{person.name}, ID: #{person.id}"
    end
    print "\nEnter a person's ID: "
    person_id = gets.chomp.to_i
    puts "Rentals list:\n"
    if @rentals.empty?
      puts 'Please ADD some rentals...'
    else
      puts 'RENTALS.'
      @rentals.select do |rental|
        if rental.person.id == person_id
          puts "#{rental.person.name.upcase} - Book: '#{rental.book.title}' by #{rental.book.author} on #{rental.date}"
        end
      end
    end
  end
end
