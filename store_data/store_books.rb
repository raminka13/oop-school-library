require 'json'

module BooksPersistence
  def store_books(books)
    data = []
    file = './books.json'
    !(File.exist?(file) && File.read(file) != '') && File.write(file, '[]')

    return unless File.exist?(file)

    books.each do |book|
      data << { title: book.title, author: book.author }
    end
    File.write(file, JSON.pretty_generate(data))
  end

  def load_books
    data = []
    file = './books.json'
    !(File.exist?(file) && File.read(file) != '') && File.write(file, '[]')
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |book|
      data << Book.new(book['title'], book['author'])
    end

    data
  end
end
