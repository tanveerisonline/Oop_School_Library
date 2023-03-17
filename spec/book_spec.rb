require_relative '../book'

describe 'Crate a book' do
  book = Book.new('Avatar', 'James Cameron')

  it 'Has a title' do
    expect(book.title).to eq('Avatar')
  end

  it 'Has an author' do
    expect(book.author).to eq('James Cameron')
  end
end
