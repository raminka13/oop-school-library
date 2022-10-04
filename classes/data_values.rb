module DataValues
  @people = []
  @books = []
  @rentals = []
  @students = []
  @teachers = []

  def self.people
    @people
  end

  def self.students
    @students
  end

  def self.teachers
    @teachers
  end

  def self.books
    @books
  end

  def self.rentals
    @rentals
  end
end
