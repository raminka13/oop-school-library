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
