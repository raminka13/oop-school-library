require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    @specialization = specialization
    super(
      age: age,
      name: name,
      parent_permission: parent_permission
    )
  end

  def can_use_services?
    true
  end
end

puts 'Enter Teacher Name'
new_name = gets.chomp
puts 'Enter Teacher Specialization'
new_specialization = gets.chomp
puts 'Enter Teacher Age'
new_age = gets.chomp.to_i

teach = Teacher.new(new_age, new_specialization, new_name)
puts("Teacher Id: #{teach.id}")
puts("Teacher Name: #{teach.name}")
puts("Teacher Specialization: #{teach.specialization}")
puts("Teacher Age: #{teach.age}")
