require_relative './console'
require_relative './music_album'
require_relative './game'
require_relative './author'
require_relative './genre'
require_relative './music_module'
require_relative './game_module'
require 'json'
require_relative './booklist'

class App
  include Console
  include DateGiver
  include MusicModule
  include GameModule
  include Booklist
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
    @books = populate_books
    @labels = populate_labels
    @music_albums = load_music_albums
    @genres = load_genres
    @games = read_games(@authors)
    @authors = read_authors
    seed_random_data
  end

  def time_format(date)
    "#{date.year}-#{date.month}-#{date.year}"
  end

  def seed_random_data
    if @authors.empty?
      @authors.push(Author.new('Josphat', 'Nkonde'))
      @authors.push(Author.new('Benjamin', 'Semah'))
      @authors.push(Author.new('Butler', 'Muwo'))
      save_authors(@authors)
    else
      puts ' '
    end
  end
end
