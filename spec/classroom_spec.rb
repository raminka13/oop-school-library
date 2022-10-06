require_relative '../template_classes/classroom'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('Winterfell')
  end

  it 'should have a label' do
    expect(@classroom.label).to eq('Winterfell')
  end

  it 'should have students' do
    expect(@classroom.students).to eq([])
  end
end
