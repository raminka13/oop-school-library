require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(id='',age, classroom, name, parent_permission)
    super(id,age, name, parent_permission)
    @classroom = classroom
    # @classroom.student.push(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
