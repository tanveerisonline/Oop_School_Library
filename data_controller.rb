require './book'
require './rental'
require './student'
require './teacher'
require 'json'

module DataController
  def get_book_by_title(title)
    @books.find { |book| book.title == title }
  end

  def get_person_by_id(id)
    @persons.find { |person| person.id == id.to_i }
  end

  def load_books
    load_data('books.json') { |element| Book.new(element['title'], element['author']) }
  end

  def load_people
    load_data('people.json') do |element|
      if element['data_type'] == 'Teacher'
        Teacher.new(
          id: element['id'].to_i,
          age: element['age'].to_i,
          specialization: element['specialization'],
          name: element['name']
        )
      else
        Student.new(
          id: element['id'].to_i,
          age: element['age'].to_i,
          name: element['name'],
          parent_permission: element['parent_permission']
        )
      end
    end
  end

  def load_rentals
    load_data('rentals.json') do |element|
      person = get_person_by_id(element['person_id'])
      book = get_book_by_title(element['book_title'])
      Rental.new(element['date'], book, person)
    end
  end

  def save_books
    data = @books.map { |book| { title: book.title, author: book.author } }
    save_data('books.json', data)
  end

  def save_people
    data = @persons.map do |person|
      {
        id: person.id,
        age: person.age,
        name: person.name,
        data_type: person.class,
        **person.to_s
      }
    end
    save_data('people.json', data)
  end

  def save_rentals
    data = @rentals.map do |rental|
      {
        date: rental.date,
        book_title: rental.book.title,
        person_id: rental.person.id
      }
    end
    save_data('rentals.json', data)
  end

  private

  def load_data(file, &block)
    if File.exist?(file) && !File.empty?(file)
      JSON.parse(File.read(file)).map(&block)
    else
      []
    end
  end

  def save_data(file, data)
    File.write(file, JSON.generate(data))
  end
end
