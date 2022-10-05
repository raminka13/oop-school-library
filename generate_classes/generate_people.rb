require_relative '../template_classes/student'
require_relative '../template_classes/teacher'
require_relative '../data_values'
require_relative '../template_classes/classroom'

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
    age, name = age_and_name('Student')
    croom = Classroom.new(classroom)
    parent_permission = permission?
    student = Student.new(age, croom, name, parent_permission)
    @people << student unless @people.include?(student)
    @students << student unless @students.include?(student)
    puts "ID:#{student.id} Student #{name.upcase} of age #{age} in #{croom.label.upcase} was created successfully!"
  end

  def age_and_name(kind)
    puts "Enter #{kind}'s name:"
    name = gets.chomp
    puts "Enter #{kind}'s age:"
    age = gets.chomp.to_i
    [age, name]
  end

  def classroom
    puts "Enter Student's classroom Name:"
    gets.chomp
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
    age, name = age_and_name('Teacher')
    parent_permission = true
    special = specialization
    teacher = Teacher.new(age, special, name, parent_permission)
    @people << teacher unless @people.include?(teacher)
    @teachers << teacher unless @teachers.include?(teacher)
    puts "ID:#{teacher.id}"
    puts "The teacher #{name.upcase} of age #{age} with the specialization #{special} was created successfully!"
  end

  def specialization
    puts "Enter Teacher's Specialization:"
    gets.chomp
  end
end
