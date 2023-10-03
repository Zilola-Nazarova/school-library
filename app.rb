require './student'
require './teacher'
require './book'
require './rental'

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

  def run
    prompt
  end
end
