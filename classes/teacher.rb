require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

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
end
