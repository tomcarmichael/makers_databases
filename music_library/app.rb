require_relative 'lib/database_connection'
require_relative 'lib/album_repository'


# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

# Perform a SQL query on the database and get the result set.
#sql = 'SELECT id, title, release_year FROM albums;'
#result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
# result.each do |record|
#   p record
# end

repo = AlbumRepository.new
albums = repo.find_id(3)
puts "#{albums[0].title} was released in #{albums[0].release_year}."