require_relative './console'

class App
  include Console

  attr_accessor :books, :music_albums, :games, :genres,
                :lables, :authors

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @labels = []
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
        Published Date: #{time_format(music_album.publish_date)},
        Archived: #{music_album.archived},
        Sportify: #{music_album.on_sportify}"
      end
    end
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
