require_relative './date_giver'
require_relative './game'
require_relative '../data/games/game'

module GameModule
  include DateGiver
  def list_all_games
    puts 'List of all Games:'
    puts 'Database is empty! Add a game.' if @games.empty?
    @games.each do |game|
      puts
      print "id:#{game.id}, Name: '#{game.name}', Date: #{game.publish_date.strftime('%Y/%m/%d')}, "
      print "MP:' #{game.multiplayer}', Last_played: #{game.last_played_at.strftime('%Y/%m/%d')}, "
    end
    puts '  '
  end

  def list_all_authors
    if @authors.empty?
      puts 'No authors available'
    else
      @authors.each_with_index do |author, index|
        puts "(#{index}) Author: #{author.first_name} #{author.last_name}"
      end
    end
  end

  # rubocop:disable Metrics/MethodLength
  def add_game
    puts 'Create a new game'
    print 'Enter game name: '
    name = gets.chomp
    year = select_year
    month = select_month
    date = select_day
    print 'Is it Multiplayer? [Y/N]: '
    multiplayer_input = gets.chomp.downcase
    multiplayer = false
    multiplayer = true if multiplayer_input == 'y'
    print 'Enter last played year: '
    year_l = gets.chomp.to_i
    print 'Enter last played month betwen 1-12: '
    month_l = gets.chomp.to_i
    print 'Enter last played date between 1-31: '
    date_l = gets.chomp.to_i
    puts 'Select index of author the game should have:'
    @authors.each_with_index { |author, index| puts "#{index}) name: #{author.first_name} #{author.last_name}" }
    author_index = gets.chomp.to_i
    new_game = Game.new(name, Time.new(year, month, date), multiplayer, Time.new(year_l, month_l, date_l))
    new_game.author = @authors[author_index]
    @games.push(new_game)
    save_games(@games)
    puts 'New game was created'
  end
  # rubocop:enable Metrics/MethodLength
end
