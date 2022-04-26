class Genre
  attr_reader :id
  
  def initialize(name, id = Random.rand(1..100_000))
    @id = id
    @name = name
    @items = []
  end
end
