class ListBooks
  def list_books(books)
    @books = books
    @books.each_with_index do |book, index|
      puts "#{index + 1}) Title: #{book.title}, Author: #{book.author}"
    end
  end
end
