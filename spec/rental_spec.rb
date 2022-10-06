require_relative '../template_classes/nameable'

require_relative '../template_classes/rental'
require_relative '../template_classes/book'
require_relative '../template_classes/person'

describe Rental do
  before(:each) do
    @single_book = Book.new('Harry Potter', 'J.K.Rowling')
    @single_person = Person.new(30, 'Raul', true)
    @new_rental = Rental.new('2020/07/12', @single_book, @single_person)
  end

  describe 'Rental#date getter' do
    it 'The Rental class getter should return date "2020/07/12"' do
      expect(@new_rental.date).to eql '2020/07/12'
    end
end
  
end