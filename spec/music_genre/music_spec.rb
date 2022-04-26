require_relative '../../app/music_album.rb'
require_relative '../../app/genre.rb'
require_relative '../../app/item.rb'

describe MusicAlbum do
  before :each do
    @first_album = MusicAlbum.new('Logozo (Angelina Kidjo)', Time.new(1992, 03, 03), true, true)
    @second_album = MusicAlbum.new('For My Brothers (Kojo Cue)', Time.new(2019, 11, 01), false, true)
    @third_album = MusicAlbum.new('Beautiful Imperfection (Asa)', Time.new(2022, 11, 01), false, false)
    @afro_genre = Genre.new('Afro Music')
    @rap_genre = Genre.new('Rap Music')
    @first_album.add_genre = @afro_genre
    @second_album.add_genre = @rap_genre
    @third_album.add_genre = @afro_genre
  end

  context 'Test for MusicAlbum class' do

    it 'checks for an instance of MusicAlbum' do
      music_album_class = @first_album.class
      expect(music_album_class).to be MusicAlbum
    end

    it 'checks attribute values of Music Albums' do
      expect(@first_album.id).to be_between(1, 100_000).inclusive
      expect(@second_album.publish_date).to eq Time.new(2019, 11, 01)
      expect(@third_album.on_spotify).to be false
      expect(@third_album.archived).to be false
    end

    it 'checks if (move_to_archive) method works correctly' do
      @first_album.move_to_archive
      @second_album.move_to_archive
      @third_album.move_to_archive
      expect(@first_album.archived).to be true
      expect(@second_album.archived).to be false
      expect(@third_album.archived).to be false
    end
  end

  context 'Test for relations between Music Album and Genre' do
    it 'checks if add_item correctly adds albums' do
      expect(@afro_genre.items.length).to eq 2
      expect(@afro_genre.items[1]).to be @third_album
      expect(@afro_genre.items[0].name).to eq 'Logozo (Angelina Kidjo)'
      expect(@rap_genre.items.length).to eq 1
      expect(@rap_genre.items[0]).to be @second_album
      expect(@rap_genre.items[0].name).to eq 'For My Brothers (Kojo Cue)'
    end
  end
end
