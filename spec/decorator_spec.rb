require_relative '../template_classes/decorator'
require_relative '../template_classes/person'

describe Decorator do
  before(:each) do
    person = Person.new(22, 'maximilianus', true)
    @capitalized_person = CapitalizeDecorator.new(person)
    @capitalized_trimmed_person = TrimmerDecorator.new(@capitalized_person)
  end

  it 'capitalized_person should be capitalized' do
    expect(@capitalized_person.correct_name).to eq('Maximilianus')
  end

  it 'capitalized_trimmed_person should be capitalized and trimed to 10 characters' do
    expect(@capitalized_trimmed_person.correct_name.length).to eq(10)
  end
end
