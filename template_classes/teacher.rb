require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :parent_permission

  def initialize(age, specialization, name, parent_permission)
    @specialization = specialization
    super(
      age,
      name,
      parent_permission
    )
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'specialization' => @specialization,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end
end
