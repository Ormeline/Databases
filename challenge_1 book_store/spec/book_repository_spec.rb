require "book_repository"

def reset_books_table
  seed_sql = File.read("spec/seeds.sql")
  connection = PG.connect({ host: "127.0.0.1", dbname: "book_store_test" })
  connection.exec(seed_sql)
end

describe BookRepository do
  before(:each) do
    reset_books_table
  end

  it "returns two books" do
    repo = BookRepository.new

    books = repo.all

    expect(books.length).to eq 2

    expect(books.first.id).to eq "1"
    expect(books.first.title).to eq "Harry Potter"
    expect(books.first.author_name).to eq "Jk Rowling"

    expect(books.last.id).to eq "2"
    expect(books.last.title).to eq "Hengry"
    expect(books.last.author_name).to eq "Jk Rowling"
  end
end