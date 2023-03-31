require_relative 'book'

class BookRepository
  def all
    sql = 'SELECT * FROM books;'
    result_set = DatabaseConnection.exec_params(sql, [])

    books = []

    result_set.each do |result|
      book = Book.new
      book.id = result['id']
      book.title = result['title']
      book.author_name = result['author_name']
      books << book
    end
    
    return books
  end
end