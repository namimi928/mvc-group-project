class AuctionController
  # unsorted methods

  

  # END unsorted methods  

  def create_auction
    auction = Auction.new(Buyer.all, Item.all)
    auction.run_auction
    puts "That concludes the bidding!"
  end
end











