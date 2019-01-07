class Item
  @@all =[]
  attr_accessor :name, :price

  def self.all
    @@all
  end

  def initialize(name,price)
    @name = name
    @price = price
    @@all << self
  end
end
