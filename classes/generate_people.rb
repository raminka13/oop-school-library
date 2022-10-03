require './student'
require './teacher'
require './data_values'
require './classroom'

class GeneratePeople
  include DataValues

  def initialize
    @people = DataValues.people
    @students = DataValues.students
    @teachers = DataValues.teachers
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
end
