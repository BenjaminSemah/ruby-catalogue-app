require_relative './console'
require_relative './music_album'
require_relative './genre'
require_relative './music_module'

class App
  include Console
  include DateGiver
  include MusicModule
  attr_accessor :books, :music_albums, :games, :genres,
                :lables, :authors

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @labels = []
    @genres = []
    @authors = []
  end

  def welcome
    puts '----------------------------------'
    puts 'Welcome to the Ruby Catalogue App!'
    puts '----------------------------------'
  end

  def load_data
    @music_albums = load_music_albums
    @genres = load_genres
  end
end
