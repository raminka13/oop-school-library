require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    self.classroom = classroom
    super(
      age,
      name,
      parent_permission
    )
  end

  def classroom=(classroom)
    @classroom = classroom
    @classroom.students.push(self) unless @classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
