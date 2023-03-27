require 'book_repository'

describe BookRepository do
  it "returns all books" do
    repo = BookRepository.new
    books = repo.all

    expect(books.length).to eq 4
    expect(books[0].id).to eq '1'
    expect(books[0].title).to eq 'Nineteen Eighty-Four'
    expect(books[0].author_name).to eq 'George Orwell'
    expect(books[2].id).to eq '3'
    expect(books[2].title).to eq 'Emma'
    expect(books[2].author_name).to eq 'Jane Austen'
  end
end
