require_relative '../template_classes/person'

describe Person do
  before(:each) do
    @person = Person.new(18, 'John Snow', true)
  end

  it 'should have a name' do
    expect(@person.name).to eq('John Snow')
  end

  it 'should have an age' do
    expect(@person.age).to eq(18)
  end

  it 'should have rentals' do
    expect(@person.rentals).to eq([])
  end

  it 'should have a can_use_services?' do
    expect(@person.can_use_services?).to eq(true)
  end
end
