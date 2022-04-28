require_relative '../../app/game'
require_relative '../../app/author'
require_relative '../../app/item'

describe Game do
  before :each do
    @first_game = Game.new('Need for Speed', Time.new(1992, 0o3, 0o3), true, Time.new(2018, 0o4, 0o6))
    @second_game = Game.new('Call of duty', Time.new(2019, 11, 0o1), false, Time.new(2015, 0o4, 0o6))
    @third_game = Game.new('Grand Theft Auto', Time.new(2022, 11, 0o1), false, Time.new(2021, 0o4, 0o6))
    @racing_genre = Genre.new('Racing Game')
    @combat_genre = Genre.new('Combat Game')
    @first_game.add_genre = @racing_genre
    @second_game.add_genre = @combat_genre
    @third_game.add_genre = @racing_genre
  end

  context 'Test for Game class' do
    it 'checks for the class of created Game' do
      game_class = @first_game.class
      expect(game_class).to be Game
    end

    it 'checks attribute values of Games' do
      expect(@first_game.id).to be_between(1, 100_000).inclusive
      expect(@second_game.publish_date).to eq Time.new(2019, 11, 0o1)
      expect(@third_game.publish_date).to eq Time.new(2022, 11, 0o1)
      expect(@third_game.archived).to be false
    end

    it 'checks if (move_to_archive) method works correctly' do
      @first_game.move_to_archive
      @second_game.move_to_archive
      @third_game.move_to_archive
      expect(@first_game.archived).to be true
      expect(@second_game.archived).to be false
      expect(@third_game.archived).to be false
    end
  end

  context 'Test for relations between Music game and author' do
    it 'checks if add_item correctly adds games' do
      expect(@racing_genre.items.length).to eq 2
      expect(@racing_genre.items[0]).to be @first_game
      expect(@racing_genre.items[0].name).to eq 'Need for Speed'
      expect(@combat_genre.items.length).to eq 1
      expect(@combat_genre.items[0]).to be @second_game
      expect(@combat_genre.items[0].name).to eq 'Call of duty'
    end
  end
end
