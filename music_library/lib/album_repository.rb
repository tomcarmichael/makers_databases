require_relative './album'

class AlbumRepository
  def all
    sql = 'SELECT id, title, release_year, artist_id FROM albums;'
    result_set = DatabaseConnection.exec_params(sql, [])

    albums = []

    result_set.each do |record|
      album = Album.new
      album.title = record['title']
      album.id = record['id'].to_i
      album.release_year = record['release_year'].to_i
      album.artist_id = record['artist_id'].to_i
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
      album.id = record['id'].to_i
      album.release_year = record['release_year'].to_i
      album.artist_id = record['artist_id'].to_i
      albums << album
    end

    return albums
  end

  def find_id(id)
    sql = 'SELECT * FROM albums WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])
    albums = []

    result_set.each do |record|
      album = Album.new
      album.title = record['title']
      album.id = record['id'].to_i
      album.release_year = record['release_year'].to_i
      album.artist_id = record['artist_id'].to_i
      albums << album
    end

    return albums
  end

  def create(album)
    sql = "INSERT INTO albums (title, release_year, artist_id) VALUES ($1, $2, $3);"
    DatabaseConnection.exec_params(sql, [album.title, album.release_year, album.artist_id])
    return nil
  end

  def print_all

    sql = 'SELECT id, title FROM albums;'
    result_set = DatabaseConnection.exec_params(sql, [])

    fstring = ["Here is the list of albums"] 

    result_set.each do |record|
      line = " * #{record['id']} - #{record['title']}"
      fstring << line
    end

    return fstring
  end
end