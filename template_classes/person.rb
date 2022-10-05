require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals, :id

  def initialize(age, name, parent_permission)
    super()
    @id = (Random.rand(1...1000) * Random.rand(1...1000)) / 100
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book)
    Rental.new(book, self)
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
