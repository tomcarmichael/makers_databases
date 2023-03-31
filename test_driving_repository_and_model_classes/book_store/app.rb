require_relative "lib/book_repository"
require_relative "lib/book"
require_relative "lib/database_connection"

DatabaseConnection.connect('book_store')

result_set = BookRepository.new
books = result_set.all

books.each do |book|
  puts "#{book.id} - #{book.title} - #{book.author_name}"
end