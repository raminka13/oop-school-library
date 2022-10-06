require_relative 'person'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(age, classroom, name, parent_permission)
    super(age, name, parent_permission)
    @classroom = classroom
    @classroom.students.push(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission,
      'classroom' => @classroom.label
    }.to_json(*args)
  end
end
