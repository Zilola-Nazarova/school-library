require 'json'
require './classroom'

module Load
  def load_files
    load_books
    load_people
    load_rentals
  end

  def load_books
    File.exist?('./books.json') ? books_json = JSON.parse(File.read('books.json')) : return
    @books = books_json.map do |book|
      Book.new(book['title'], book['author'])
    end
  end

  def load_people
    File.exist?('./people.json') ? people_json = JSON.parse(File.read('people.json')) : return
    @people = people_json.map { |person| identify_person(person) }
  end

  def load_rentals
    File.exist?('./rentals.json') ? rentals_json = JSON.parse(File.read('rentals.json')) : return
    @rentals = rentals_json.map do |rental|
      person = identify_person(rental['person'])
      Rental.new(rental['date'], Book.new(rental['book']['title'], rental['book']['author']), person)
    end
  end

  def identify_person(person)
    if person['specialization']
      teacher = Teacher.new(person['specialization'], person['age'], person['name'])
      teacher.id = person['id']
      teacher
    else
      student = Student.new(Classroom.new(person['classroom']), person['age'], person['name'],
                            parent_permission: person['parent_permission'])
      student.id = person['id']
      student
    end
  end
end
