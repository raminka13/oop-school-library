require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    @classroom = classroom
    super(
      age: age,
      name: name,
      parent_permission: parent_permission
    )
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

puts 'Enter Student Name'
new_name = gets.chomp
puts 'Enter Student Classroom'
new_classroom = gets.chomp
puts 'Enter Student Age'
new_age = gets.chomp.to_i

stud = Student.new(new_age, new_classroom, new_name)
puts("Student Id: #{stud.id}")
puts("Student Name: #{stud.name}")
puts("Student Classroom: #{stud.classroom}")
puts("Student Age: #{stud.age}")
puts stud.play_hooky
