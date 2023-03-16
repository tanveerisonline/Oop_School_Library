# require './student'
# require './teacher'
# require './book'
# require './rental'
# require 'json'

# module DataController
#   def load_peoble
#     file = 'people.json'
#     data = []
#     if File.exist?(file) && File.read(file) != ''
#       JSON.parse(File.read(file)).each do |element|
#         if element['data_type'] == 'Teacher'
#           data.push(Teacher.new(id: element['id'].to_i, age: element['age'].to_i,
#                                 specialization: element['specialization'], name: element['name']))
#         else
#           data.push(Student.new(id: element['id'].to_i, age: element['age'].to_i, name: element['name'],
#                                 parent_permission: element['parent_permission']))
#         end
#       end
#     end
#     data
#   end

#   def load_books
#     file = 'books.json'
#     data = []
#     if File.exist?(file) && File.read(file) != ''
#       JSON.parse(File.read(file)).each do |element|
#         data.push(Book.new(element['title'], element['author']))
#       end
#     end
#     data
#   end

#   def get_person_by_id(id)
#     @persons.each { |element| return element if element.id == id.to_i }
#   end

#   def get_book_by_title(title)
#     @books.each { |element| return element if element.title == title }
#   end

#   def load_rentals
#     file = 'rentals.json'
#     data = []
#     if File.exist?(file) && File.read(file) != ''
#       JSON.parse(File.read(file)).each do |element|
#         person = get_person_by_id(element['person_id'])
#         book = get_book_by_title(element['book_title'])
#         puts book
#         data.push(Rental.new(element['date'], book, person))
#       end
#     end
#     data
#   end

#   def save_person
#     data = []
#     @persons.each do |person|
#       if person.instance_of?(Teacher)
#         data.push({ id: person.id, age: person.age, name: person.name,
#                     specialization: person.specialization, data_type: person.class })
#       else
#         data.push({ id: person.id, age: person.age, name: person.name,
#                     parent_permission: person.parent_permission, data_type: person.class })
#       end
#     end
#     File.write('people.json', JSON.generate(data))
#   end

#   def save_books
#     data = []
#     @books.each do |book|
#       data.push({ title: book.title, author: book.author })
#     end
#     File.write('books.json', JSON.generate(data))
#   end

#   def save_rental
#     data = []
#     @rentals.each do |rental|
#       data.push({ date: rental.date, book_title: rental.book.title, person_id: rental.person.id })
#     end
#     File.write('rentals.json', JSON.generate(data))
#   end
# end

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
        **person.to_hash
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
