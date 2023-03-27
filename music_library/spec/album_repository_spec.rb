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
    expect(albums.first.id).to eq '1'
    expect(albums[0].title).to eq 'Doolittle'
    expect(albums[0].release_year).to eq '1989'
    expect(albums[2].artist_id).to eq '2'
    expect(albums[2].title).to eq 'Waterloo'
    expect(albums[2].release_year).to eq '1974'
  end

  it 'finds a single album' do
    repo = AlbumRepository.new
    album = repo.find('Surfer Rosa')

    expect(album.first.artist_id).to eq '1'
    expect(album.first.title).to eq 'Surfer Rosa'
    expect(album.first.release_year).to eq '1988'
  end
end