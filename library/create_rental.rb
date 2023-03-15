require_relative 'list_people'
require_relative 'list_books'

class CreateRental
  def initialize(people, books, rentals)
    @people = people
    @books = books
    @rentals = rentals
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    ListBooks.new.list_books(@books)
    book_index = gets.chomp.strip.to_i
    puts 'Select a person from the following list by number (not id)'
    ListPeople.new.list_people(@people)
    person_index = gets.chomp.strip.to_i
    puts 'Date [YYYY/MM/DD]: '
    date = gets.chomp.strip
    @rentals << Rental.new(@books[book_index - 1], @people[person_index - 1], date)
    puts 'Rental created successfully.'
  end
end
