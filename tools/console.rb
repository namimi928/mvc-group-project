require 'pry'
require_relative "../config/environment"


#buyer_controller.welcome_and_add_visitor
puts "Welcome to the Slack Beef Auction House! \nWhat is your name?"
name = gets.chomp
buyer = Buyer.new(name)

  #item_controller.new_item
  puts "Thank you for visiting, #{buyer.name}! \nWhat item would you like to bid on?"
  item_name = gets.chomp
  item = Item.new(item_name)


puts "How much would you like to bid for this lovely #{item.name}?"
bid? = 'yes'
while item.sold == false && bid? == 'yes'
  bid_amount = gets.chomp.to_i
  # binding.pry
  if bid_amount <= 0
    puts "That is not a valid amount. \nPlease enter an amount greater than zero."  
  elsif bid_amount < item.highest_bid
    puts "Dont be a peasant, your bid needs to be greater than #{item.bids.last.amount}!"
  else 
    buyer.make_bid(bid_amount, item)
    puts "You made a bid of $#{bid_amount} on #{item.name}!"
    item.sold?
    puts "Would you like to bid again? (yes/no)"
    bid? = gets.chomp.downcase
  end
end
  if item.sold == true
    puts "Congratulations, your bid of $#{bid_amount} won the #{item.name}"  
  else
    puts "Sorry, you didn't win the #{item}! Try being richer next time."
  end


puts 'hi'