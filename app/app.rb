require_relative './console'
require_relative './date_giver'
require_relative './music_album'
require_relative './genre'
require_relative '../data/music/music'
require_relative '../data/genre/genre'
require 'json'

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
    @genres = []
    @authors = []
  end

  def welcome
    puts 'Welcome to the Catalog of my Things!'
  end

  def list_music_albums
    if @music_albums.empty?
      puts 'No Music Albums available.'
    else
      @music_albums.each_with_index do |music_album, index|
        print "
        (#{index})
        Album: #{music_album.name},
        Genre: #{@genres.empty? ? 'No genres available' : music_album.genre.name},
        Published Date: #{time_format(music_album.publish_date)},
        Archived: #{music_album.archived},
        Spotify: #{music_album.on_spotify}"
        puts ''
      end
    end
    puts ''
  end

  def add_music_album
    print 'Album Name: '
    name = gets.chomp
    year = select_year
    month = select_month
    day = select_day

    print "Available on Spotify? (Y/N): "
    spotify_answer = gets.chomp.downcase
    until %w[y n].include?(spotify_answer)
      print "Available on Spotify? (Y/N): "
      spotify_answer = gets.chomp.downcase
    end

    music_album = MusicAlbum.new(name, Time.new(year, month, day), false, spotify_answer == 'y')

    unless @genres.empty?
      puts 'Select genre: '
      list_all_genres
      genre_index = gets.chomp.to_i
      music_album.add_genre = @genres[genre_index]
    end

    @music_albums.push(music_album)
    save_music_albums(@music_albums)
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

  def load_data
    @music_albums = load_music_albums
    @genres = load_genres
  end
end
