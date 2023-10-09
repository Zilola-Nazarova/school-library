require './student'
require './teacher'
require './book'
require './rental'

module Listers
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

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    if @people.none? { |person| person.id == id }
      puts "Person with id = #{id} doesn't exist"
      return
    end

    selected = @rentals.find_all { |rental| rental.person.id == id }
    if selected.empty?
      puts "Person with id = #{id} has no rentals"
      return
    end

    puts 'Rentals:'
    selected.map { |rental| puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" }
  end
end
