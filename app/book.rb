require_relative '.\item'

class Book < Item
  attr_accessor :cover_state, :publisher

  # rubocop:disable Metrics/ParameterLists
  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(name, _publish_date, publisher, cover_state, archived = false, id = Random.rand(1..100_000))
    super(name, published_date, archived, id)
    @publisher = publisher
    @cover_state = cover_state
  end
  # rubocop:enable Metrics/ParameterLists
  # rubocop:enable Style/OptionalBooleanParameter

  private

  def can_be_archived?
    super && @cover_state
  end
end
