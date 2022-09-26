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
