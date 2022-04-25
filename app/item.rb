class Item
  attr_accessor :name, :publish_date
  attr_reader :id, :archived, :genre, :author, :label

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(name, publish_date, archived = false, id = Random.rand(1..100_000))
    @id = id
    @name = name
    @publish_date = publish_date # Time.new(yyyy, mm, dd)
    @archived = archived
  end
  # rubocop:enable Style/OptionalBooleanParameter

  def add_label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def add_genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def add_author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end
end
