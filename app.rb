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

  def create_person
    puts 'Which do you want to create? A student (press 1) or a teacher (press 2)?'
    num = gets.chomp.to_i
    case num
    when 1
      student_option
    when 2
      teacher_option
    end
  end

  def student_option
    puts "Enter Student's name:"
    name = gets.chomp
    puts "Enter Student's age:"
    age = gets.chomp.to_i
    puts "Enter Student's classroom Name:"
    croom = gets.chomp
    classroom = Classroom.new(croom)
    parent_permission = permission?
    student = Student.new(age, classroom, name, parent_permission)
    @people << student unless @people.include?(student)
    @students << student unless @students.include?(student)
    puts "ID:#{student.id} Student #{name.upcase} of age #{age} in #{classroom.label.upcase} was created successfully!"
  end

  def permission?
    print 'Has parent permission? [Y/N]:'
    permission = gets.chomp
    case permission
    when 'n', 'N', 'no', 'NO', 'No'
      parent_permission = false
    when 'y', 'Y', 'yes', 'YES', 'Yes'
      parent_permission = true
    else
      print "\nEnter a valid option\n".upcase
      permission?
    end
    parent_permission
  end

  def teacher_option
    puts "Enter the teacher's name:"
    name = gets.chomp
    puts "Enter Teacher's Age:"
    age = gets.chomp.to_i
    puts "Enter Teacher's Specialization:"
    specialization = gets.chomp
    parent_permission = true
    teacher = Teacher.new(age, specialization, name, parent_permission)
    @people << teacher unless @people.include?(teacher)
    @teachers << teacher unless @teachers.include?(teacher)
    puts "ID:#{teacher.id}"
    puts "The teacher #{name.upcase} of age #{age} with the specialization #{specialization} was created successfully!"
  end

  def list_all_people
    puts "People's list:\n\n"
    if @people.empty?
      puts 'Please ADD some people...'
    else
      @people.each_with_index do |person, index|
        if person.instance_of?(Student)
          print "\n#{index}) [Student]
          Name: #{person.name}, ID: #{person.id},Age: #{person.age}, Classroom: #{person.classroom.label}\n"
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
end
