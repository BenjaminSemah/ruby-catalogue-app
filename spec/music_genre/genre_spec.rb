require_relative '../../app/music_album.rb'
require_relative '../../app/genre.rb'
require_relative '../../app/item.rb'

describe Genre do
  before :each do
    @afro_genre = Genre.new('Afro Music')
    @rap_genre = Genre.new('Rap Music')
    @first_album = MusicAlbum.new('Logozo (Angelina Kidjo)', Time.new(1992, 03, 03), true, true)
    @second_album = MusicAlbum.new('For My Brothers (Kojo Cue)', Time.new(2019, 11, 01), false, true)
    @first_album.add_genre = @afro_genre
    @second_album.add_genre = @rap_genre
  end

  context 'Test for the Genre class' do
    it 'checks for an instance of Genre' do
      expect(@afro_genre).to be_instance_of(Genre)
    end

    it 'checks if new genre attributes is correct' do
      expect(@afro_genre.name).to eq 'Afro Music'
      expect(@rap_genre.name).to eq 'Rap Music'
      expect(@rap_genre.id).to be_between(1, 100_000).inclusive
    end

    it 'checks if add_item works properly for genre' do
      expect(@afro_genre.items.length).to eq 1
      expect(@afro_genre.items[0]).to be @first_album
      expect(@afro_genre.items[0].name).to eq 'Logozo (Angelina Kidjo)'
      expect(@rap_genre.items.length).to eq 1
      expect(@rap_genre.items[0]).to be @second_album
      expect(@rap_genre.items[0].name).to eq 'For My Brothers (Kojo Cue)'
    end
  end
end
