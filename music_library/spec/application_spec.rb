require_relative '../app'
require 'album_repository'
require 'artist_repository'

describe Application do
  it "Prints the list of albums when user select option 1" do
    io = double :io
    # Alternate test formulation that tests integration rather than unit:
    # album_repository = AlbumRepository.new
    album_repository = double :AlbumRepository
    allow(album_repository).to receive(:print).and_return(["Here is the list of albums", " * 2 - Surfer Rosa",
      " * 4 - Super Trouper", " * 5 - Bossanova", " * ...My Wings", " * 3 - Waterloo",
      " * 1 - Dark Side of the Moon", " * 13 - Mezzanine", " * 14 - Voodoo"])
    application = Application.new('music_library', io, album_repository, ArtistRepository.new)
    expect(io).to receive(:puts).with("Welcome to the music library manager!").ordered
    expect(io).to receive(:puts).with(" ").ordered
    expect(io).to receive(:puts).with("What would you like to do?").ordered
    expect(io).to receive(:puts).with(" 1 - List all albums").ordered
    expect(io).to receive(:puts).with(" 2 - List all artists").ordered
    expect(io).to receive(:puts).with(" ").ordered
    expect(io).to receive(:puts).with("Enter your choice:").ordered
    expect(io).to receive(:gets).and_return("1").ordered
    expect(io).to receive(:puts).with(" ").ordered
    # Alternate test formulation that tests integration rather than unit:
    # expect(io).to receive(:puts).with(["Here is the list of albums", " * 2 - Surfer Rosa",
    #   " * 4 - Super Trouper", " * 5 - Bossanova", " * ...My Wings", " * 3 - Waterloo",
    #   " * 1 - Dark Side of the Moon", " * 13 - Mezzanine", " * 14 - Voodoo"]).ordered
    expect(io).to receive(:puts).with(album_repository.print).ordered
    application.run
  end

 end