class Item

  attr_accessor :name, :bids, :sold, :interest, :highest_bid, :highest_bidder
  @@all = []

  def initialize(name)
    @name = name
    @bids = []
    @sold = false
    @interest = true
    @highest_bid = 0
    @highest_bidder = ""
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