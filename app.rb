require_relative './library/student'
require_relative './library/teacher'
require_relative './library/book'
require_relative './library/rental'
require_relative './library/validation'
require_relative './library/create_person'
require_relative './library/person'
require_relative './library/create_book'
require_relative './library/list_books'
require_relative './library/create_rental'
require_relative './library/list_rental'

class App
  include Validation

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def select_choice
    choice = validate_options('', (1...9))
    case choice
    when 1, 2, 6
      list_tasks(choice)
    when 3, 4, 5
      create_tasks(choice)
    when 7
      exit
    else
      puts 'Unknown option, please select from the options menu.'
    end
  end

  def list_tasks(choice)
    case choice
    when 1
      list_books
    when 2
      list_people
    when 6
      list_rental
    end
  end

  def create_tasks(choice)
    case choice
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    end
  end

  # def create_person
  #   person = CreatePerson.new(@people)
  #   person.create_person
  # end

  # def create_book
  #   CreateBook.new.create_book(@books)
  # end

  # def list_people
  #   @people.each_with_index do |person, index|
  #     puts "#{index + 1}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  #   end
  # end

  # def list_books
  #   ListBooks.new.list_books(@books)
  # end

  # def create_rental
  #   CreateRental.new(@people, @books, @rentals).create_rental
  # end

  # def list_rental
  #   ListRental.new.list_rental(@rentals)
  # end
end
