require "album_repository"
require "album"


def reset_albums_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

describe AlbumRepository do
  before(:each) do 
    reset_albums_table
  end
  it "Returns all albums" do
    repo = AlbumRepository.new
    albums = repo.all
    expect(albums.length).to eq 3
    expect(albums.first.id).to eq 1
    expect(albums[0].title).to eq 'Doolittle'
    expect(albums[0].release_year).to eq 1989
    expect(albums[2].artist_id).to eq 2
    expect(albums[2].title).to eq 'Waterloo'
    expect(albums[2].release_year).to eq 1974
  end

  it 'finds a single album by title' do
    repo = AlbumRepository.new
    album = repo.find('Surfer Rosa')

    expect(album.first.artist_id).to eq 1
    expect(album.first.title).to eq 'Surfer Rosa'
    expect(album.first.release_year).to eq 1988
  end

  it 'finds a single album by id' do
    repo = AlbumRepository.new
    album = repo.find_id(3)

    expect(album.first.artist_id).to eq 2
    expect(album.first.title).to eq 'Waterloo'
    expect(album.first.release_year).to eq 1974
  end

  it "creates a new album record" do
    repo = AlbumRepository.new
    album = Album.new
    album.title = "Let It Be"
    album.release_year = 1970
    album.artist_id = 3
    repo.create(album)
    albums = repo.all
    expect(albums.length).to eq 4
    expect(albums.last.title).to eq "Let It Be"
    expect(albums.last.release_year).to eq 1970
    expect(albums.last.artist_id).to eq 3

  end
end