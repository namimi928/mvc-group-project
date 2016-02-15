class Item

  attr_accessor :name, :bids, :sold, :highest_bid
  def initialize(name)
    @name = name
    @bids = []
    @sold = false
    @highest_bid = 0
  end

  def sold?

    @sold = [true, false, false, false,false].sample
    
  end
  
end