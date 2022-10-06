require_relative '../template_classes/nameable'

describe Nameable do
  before(:each) do
    @new_nameable = Nameable.new
  end

  it 'can raise an error' do
    expect { @new_nameable.correct_name }.to raise_error(NotImplementedError)
  end
end
