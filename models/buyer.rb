require 'pry'
class Buyer
  attr_accessor :name, :bids

  @@all = []

  def initialize(name)
    @name = name
    @bids = []
    @@all << self
  end

  def make_bid(amount, item)
    bid = Bid.new(amount)
    bid.buyer = self
    item.bids << bid
    @bids<<bid
    item.highest_bid = amount
   # binding.pry 
  end

  def self.all
    @@all
  end 

  def self.list_buyer_names
    self.all.empty? ? "* No registered buyers *" : self.all.map {|buyer| buyer.name}
  end
end