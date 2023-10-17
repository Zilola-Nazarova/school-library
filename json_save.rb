require 'json'

module Save
  def save_files
    save_books
    save_people
    save_rentals
  end

  def save_books
    books_json = @books.map do |book|
      {
        title: book.title,
        author: book.author
      }
    end
    File.write('./books.json', JSON.generate(books_json))
  end

  def save_people
    people_json = []
    @people.map do |person|
      person_json = {
        id: person.id,
        name: person.name,
        age: person.age
      }
      append_data(person, person_json)
      people_json.push(person_json)
    end
    File.write('./people.json', JSON.generate(people_json))
  end

  def save_rentals
    rentals_json = []
    @rentals.map do |rental|
      rental_json = {
        book: {
          title: rental.book.title,
          author: rental.book.author
        },
        person: {
          id: rental.person.id,
          name: rental.person.name,
          age: rental.person.age
        },
        date: rental.date
      }
      append_data(rental.person, rental_json[:person])
      rentals_json.push(rental_json)
    end
    File.write('./rentals.json', JSON.generate(rentals_json))
  end

  def append_data(person, person_json)
    if person.instance_of?(::Teacher)
      person_json[:specialization] = person.specialization
    else
      person_json[:parent_permission] = person.parent_permission
      person_json[:classroom] = person.classroom.label
    end
    person_json
  end
end
