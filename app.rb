require './student'
require './teacher'
require './book'
require './rental'
require 'pry'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def list_books
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_books_with_index
    @books.each_with_index { |book, i| puts "#{i}) Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_people
    @people.each do |person|
      puts "[#{person.class.name}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_people_with_index
    @people.each_with_index do |person, i|
      puts "#{i}) [#{person.class.name}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    student_or_teacher = gets.chomp.to_i
    if student_or_teacher == 1
      create_student
    elsif student_or_teacher == 2
      create_teacher
    else
      puts "Error: option has an invalid value (#{student_or_teacher})"
      create_person
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_s

    loop do
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.to_s
      if parent_permission =~ /^[Yy]/
        @student = Student.new('Unknown', age, name, parent_permission: true)
        break
      elsif parent_permission =~ /^[Nn]/
        @student = Student.new('Unknown', age, name, parent_permission: false)
        break
      else
        puts "Error: option has an invalid value (#{parent_permission})"
      end
    end

    @people.push(@student)
    puts 'Person created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp.to_s

    print 'Specialization: '
    specialization = gets.chomp.to_s

    teacher = Teacher.new(specialization, age, name)
    @people.push(teacher)
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp.to_s
    print 'Author: '
    author = gets.chomp.to_s
    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def create_rental
    choose_book
    choose_person
    print 'Date: '
    date = gets.chomp.to_s
    @rentals.push(Rental.new(date, @selected_book, @selected_person))
    puts 'Rental created successfully'
  end

  def choose_book
    loop do
      puts "\nSelect a book from the following list by number"
      list_books_with_index
      book_index = gets.chomp
      book_index = book_index.to_i if book_index != ''
      if (0...@books.length).include?(book_index)
        @selected_book = @books[book_index]
        break
      end
      puts "Can not add a record. Book \"#{book_index}\" doesn't exist"
    end
  end

  def choose_person
    loop do
      puts "\nSelect a person from the following list by number (not id)"
      list_people_with_index
      person_index = gets.chomp
      person_index = person_index.to_i if person_index != ''
      if (0...@people.length).include?(person_index)
        @selected_person = @people[person_index]
        break
      end
      puts "Can not add a record. Person \"#{person_index}\" doesn't exist"
    end
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    selected = @rentals.find_all { |rental| rental.person.id == id }
    if selected.nil?
      puts "Person with id=#{id} doesn't exist"
      return
    end
    puts 'Rentals:'
    selected.map { |rental| puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" }
  end

  def run
    prompt
  end
end
