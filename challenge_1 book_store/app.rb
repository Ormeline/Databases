require_relative "./lib/database_connection"
require_relative "./lib/book_repository"

DatabaseConnection.connect("book_store")

book_repository = BookRepository.new

book_repository.all.each do |record|
  p record.id + "-" + record.title + "-" + record.author_name
end