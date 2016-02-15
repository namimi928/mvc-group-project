require 'pry'
class Bid
  attr_accessor :amount, :buyer

  def initialize(amount)
    @amount = amount

    # binding.pry
  end
  
  def is_valid?
    bid.amount > 0
    
  end
end
