require_relative 'nameable'
require_relative 'decorator'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name
trimmed_person = TrimmerDecorator.new(person)
puts trimmed_person.correct_name
capitalized_trimmed_person = CapitalizeDecorator.new(trimmed_person)
puts capitalized_trimmed_person.correct_name
