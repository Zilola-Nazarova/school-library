require 'json'

module Save
  def save_files
    puts "Saving files"
    save_books
    save_people
    save_rentals
  end

  def save_books
    File.open("./books.json", "w") {|f| f.write("Books list") }
  end

  def save_people
    File.open("./people.json", "w") {|f| f.write("Pelple list") }
  end

  def save_rentals
    File.open("./rentals.json", "w") {|f| f.write("Rentals list") }
  end
end