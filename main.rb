require './app'

def show_options
  puts "\nPlease choose and option by entering a number:
1 - List all books\n2 - List all people\n3 - Create a person
4 - Create a book\n5 - Create a rental
6 - List all rentals for a given person id\n7 - Exit"
end

def prompt
  puts 'Welcome to School Library App!'
  loop do
    show_options
    option = gets.chomp.to_i
    break if option == 7

    call_option(option)
  end
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
  else
    puts 'Choose a number between 1 and 7'
  end
end

def main
  app = App.new
  app.run
end

main
