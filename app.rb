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

  def run
    prompt
  end
end
