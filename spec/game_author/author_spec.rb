require './app/game'
require './app/item'
require './app/author'

describe Author do
  before :each do
    @racing_genre = Genre.new('Racing Game')
    @combat_genre = Genre.new('Combat Game')
    @first_game = Game.new('Need for Speed', Time.new(1992, 0o3, 0o3), true, true)
    @second_game = Game.new('Call of duty', Time.new(2019, 11, 0o1), false, true)
    @first_game.add_genre = @racing_genre
    @second_game.add_genre = @combat_genre
  end

  context 'Test for the Author class' do
    it 'checks for an instance of Author' do
      expect(@racing_genre).to be_instance_of(Genre)
    end

    it 'checks if new genre attributes is correct' do
      expect(@racing_genre.name).to eq 'Racing Game'
      expect(@combat_genre.name).to eq 'Combat Game'
      expect(@combat_genre.id).to be_between(1, 100_000).inclusive
    end

    it 'checks if add_item works properly for genre' do
      expect(@racing_genre.items.length).to eq 1
      expect(@racing_genre.items[0]).to be @first_game
      expect(@racing_genre.items[0].name).to eq 'Need for Speed'
      expect(@combat_genre.items.length).to eq 1
      expect(@combat_genre.items[0]).to be @second_game
      expect(@combat_genre.items[0].name).to eq 'Call of duty'
    end
  end
end
