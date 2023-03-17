require_relative '../person'

describe Person do
  context 'Creating a new person' do
    it 'has a name and age' do
      person = Person.new(25, 'John')
      expect(person.name).to eq('John')
      expect(person.age).to eq(25)
    end

    it 'defaults to an unknown name' do
      person = Person.new(25)
      expect(person.name).to eq('Unknown')
    end

    it 'can use services if of age' do
      person = Person.new(25)
      expect(person.can_use_services?).to be_truthy
    end

    it 'can use services if parent permission is given' do
      person = Person.new(10, 'Jane', true)
      expect(person.can_use_services?).to be_truthy
    end

    it 'cannot use services without parent permission if underage' do
      person = Person.new(10, 'Jane', false)
      expect(person.can_use_services?).to be_falsey
    end

    it 'generates a random id between 1 and 1000' do
      person = Person.new(25)
      expect(person.id).to be_between(1, 1000).inclusive
    end

    it 'adds a rental to their rentals list' do
      person = Person.new(25)
      book = double('book')
      rental = double('rental')
      allow(Rental).to receive(:new).and_return(rental)
      person.add_rental('2023-03-16', book)
      expect(person.rentals).to include(rental)
    end
  end
end
