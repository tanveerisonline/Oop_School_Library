class CreateBook
  def create_book(books)
    @books = books
    print 'Title: '
    title = gets.chomp.strip

    print 'Author: '
    author = gets.chomp.strip
    @books << Book.new(title, author)

    puts 'Book created successfully'
  end
end
