require './creators'
require './listers'
require './json_save'
require './json_load'

class App
  include Save
  include Load
  include Creators
  include Listers

  OPTIONS_HASH = {
    1 => :list_books,
    2 => :list_people,
    3 => :create_person,
    4 => :reate_book,
    5 => :create_rental,
    6 => :list_rentals
  }.freeze

  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @rentals = []
    @people = []
    load_files
  end

  def call_option(option)
    if option == 7
      save_files
      puts 'Thank you for using our app!'
    else
      method(OPTIONS_HASH[option]).call
    end
  end
end
