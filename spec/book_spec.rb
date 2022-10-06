require_relative '../template_classes/book'

describe Book do
  before(:each) do
    @book = Book.new('Dancing with Dragons', 'G.R.R. Martin')
  end

  it 'should have a title' do
    expect(@book.title).to eq('Dancing with Dragons')
  end

  it 'should have an author' do
    expect(@book.author).to eq('G.R.R. Martin')
  end

  it 'should have rentals' do
    expect(@book.rentals).to eq([])
  end
end
