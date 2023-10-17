require './creators'
require './listers'
require './json_save'
require './json_load'

class App
  include Save
  include Load
  include Creators
  include Listers

  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @rentals = []
    @people = []
    load_files
  end

  def call_option(option)
    case option
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    when 7
      save_files
      puts "Thank you for using our app!"    
    end
  end
end
