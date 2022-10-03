require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name, parent_permission)
    super(age, name, parent_permission)
    @classroom = classroom
    @classroom.students.push(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
