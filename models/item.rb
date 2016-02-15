class Item

  attr_accessor :name, :bids, :sold, :highest_bid

  @@all = []

  def initialize(name)
    @name = name
    @bids = []
    @sold = false
    @highest_bid = 0
    @@all << self
  end

  def sold?
    @sold = [true, false, false, false,false].sample
  end

  def self.all
    @@all
  end

  def self.list_item_names
    self.all.map {|item| item.name}
  end
end