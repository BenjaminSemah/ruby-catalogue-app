require_relative './console'
require_relative './music_album'
require_relative './genre'
require_relative './date_giver'

class App
  include Console
  include DateGiver
  attr_accessor :books, :music_albums, :games, :genres,
                :lables, :authors

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @labels = []
    @genres = [Genre.new('Afrobeats'), Genre.new('Rap')]
    @authors = []
  end

  def welcome
    puts 'Welcome to the Catalog of my Things!'
  end

  def time_format(date)
    "#{date.year}-#{date.month}-#{date.year}"
  end

  def list_music_albums
    if @music_albums.empty?
      puts 'No Music Albums available.'
    else
      @music_albums.each_with_index do |music_album, index|
        puts "
        (#{index})
        Album: #{music_album.name},
        Genre: #{music_album.genre},
        Published Date: #{time_format(music_album.publish_date)},
        Archived: #{music_album.archived},
        Spotify: #{music_album.on_spotify}"
      end
    end
  end

  def add_music_album
    print 'Album Name: '
    name = gets.chomp
    year = select_year
    month = select_month
    day = select_day

    music_album = MusicAlbum.new(name, Time.new(year, month, day))

    puts 'Select genre: '
    list_all_genres
    genre_index = gets.chomp.to_i
    music_album.add_genre = @genres[genre_index]
    @music_albums.push(music_album)
    puts 'New Music Album created successfully!'
  end

  def list_all_genres
    if @genres.empty?
      puts 'No Genres available'
    else
      @genres.each_with_index do |genre, index|
        puts "(#{index}) Genre: #{genre.name}"
      end
    end
  end
end
