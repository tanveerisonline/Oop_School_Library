require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  context 'Testing Rental' do
    let(:book) { Book.new('The Hitchhiker\'s Guide to the Galaxy', 'Douglas Adams') }
    let(:person) { Person.new(20, 'John Doe', true) }
    let(:rental) { Rental.new('2022-03-16', book, person) }

    it 'correct rental date' do
      expect(rental.date).to eql '2022-03-16'
    end

    it 'correct rental book' do
      expect(rental.book).to eql book
    end

    it 'correct rental person' do
      expect(rental.person).to eql person
    end

    it 'correct book rentals' do
      expect(book.rentals).to include rental
    end

    it 'correct person rentals' do
      expect(person.rentals).to include rental
    end
  end
end
