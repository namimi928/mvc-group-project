class BuyerController

  def welcome_and_add_visitor
    puts "Welcome to the Slack Beef Auction House! \nWhat is your name?"
    name = gets.chomp
    buyer = Buyer.new(name)    
  end

  
end