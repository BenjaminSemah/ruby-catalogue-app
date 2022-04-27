require_relative './item'

class MusicAlbum < item
  attr_accessor :on_spotify
  def initialize(name, publish_date, archived = false, on_spotify = false, id = Random.rand(1..100_000))
    super(name, publish_date, archived, id)
    @on_spotify = on_spotify
  end
  # rubocop:enable Style/OptionalBooleanParameter

  private

  def can_be_archived?
    super && @on_spotify
  end
end
