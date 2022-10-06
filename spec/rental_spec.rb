require_relative '../template_classes/nameable'
require_relative '../template_classes/rental'
require_relative '../template_classes/book'
require_relative '../template_classes/person'

describe Rental do
  before(:each) do
    @book = Book.new('Harry Potter', 'J.K.Rowling')
    @person = Person.new(30, 'Raul', true)
    @rental = Rental.new(@person, @book)
    p @rental.date
  end

  it 'The Rental class getter should return date 10/06/2022' do
    expect(@rental.date).to match '10/06/2022'
  end

  it 'The Rental class getter should return person name' do
    expect(@rental.person.name).to eql 'Raul'
  end

  it 'The Rental class getter should return person id' do
    expect(@rental.person.id).to be > 0
  end

  it 'The Rental class getter should return book title' do
    expect(@rental.book.title).to eql 'Harry Potter'
  end
end
