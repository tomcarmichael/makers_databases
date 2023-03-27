require_relative './album'

class AlbumRepository
  def all
    sql = 'SELECT id, title, release_year, artist_id FROM albums;'
    result_set = DatabaseConnection.exec_params(sql, [])

    albums = []

    result_set.each do |record|
      album = Album.new
      album.title = record['title']
      album.id = record['id']
      album.release_year = record['release_year']
      album.artist_id = record['artist_id']
      albums << album
    end

    return albums
  end

  def find(title)
    sql = 'SELECT * FROM albums WHERE title = $1;'
    result_set = DatabaseConnection.exec_params(sql, [title])
    albums = []

    result_set.each do |record|
      album = Album.new
      album.title = record['title']
      album.id = record['id']
      album.release_year = record['release_year']
      album.artist_id = record['artist_id']
      albums << album
    end

    return albums
  end

end