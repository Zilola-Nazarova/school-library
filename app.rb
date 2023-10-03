require './student'
require './teacher'
require './book'
require './rental'
# require './main'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def run
    prompt
  end
end
