require 'pry'
class Buyer
  attr_accessor :name, :bids

  def initialize(name)
    @name = name
    @bids = []
  end

  def make_bid(amount, item)
    bid = Bid.new(amount)
    bid.buyer = self
    item.bids << bid
    @bids<<bid
    item.highest_bid = amount
   # binding.pry 
  end
  
end