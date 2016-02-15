require 'pry'
require_relative "../config/environment"
require_relative "seed.rb"

commands = <<-LIST
- Enter '1' to register a new buyer.
- Enter '2' to see a list of buyers.
- Enter '4' to see a list of items.
- Type 'exit' to leave the Auction House.
LIST

#buyer_controller.welcome_and_add_visitor
puts "Welcome to the Slack Beef Auction House!"
puts "What would you like to do? Enter:"
puts commands

input = nil
while input != 'exit'
  puts "\nWhat would you like to do? Type 'help' to see available commands."
  input = gets.chomp.downcase

  case input
  when '1'
    controller = BuyerController.new
    buyer_name = controller.prompt_buyer_creation
    controller = BuyerController.new
    controller.create(buyer_name)
  when '2'
    controller = BuyerController.new
    controller.list_buyers
  when '4'
    controller = ItemController.new
    controller.list_items
  when 'help'
    puts commands
  when 'exit'
    puts "Goodbye!"
  else
    puts "Please enter a valid command."
  end
end











# name = gets.chomp
# buyer = Buyer.new(name)

#   #item_controller.new_item
#   puts "Thank you for visiting, #{buyer.name}! \nWhat item would you like to bid on?"
#   item_name = gets.chomp
#   item = Item.new(item_name)


# puts "How much would you like to bid for this lovely #{item.name}?"
# bid = 'yes'
# while item.sold == false && bid == 'yes'
#   bid_amount = gets.chomp.to_i
#   # binding.pry
#   if bid_amount <= 0
#     puts "That is not a valid amount. \nPlease enter an amount greater than zero."  
#   elsif bid_amount < item.highest_bid
#     puts "Dont be a peasant, your bid needs to be greater than #{item.bids.last.amount}!"
#   else 
#     buyer.make_bid(bid_amount, item)
#     puts "You made a bid of $#{bid_amount} on #{item.name}!"
#     item.sold?
#     puts "Would you like to bid again? (yes/no)"
#     bid = gets.chomp.downcase
#   end
# end
#   if item.sold == true
#     puts "Congratulations, your bid of $#{bid_amount} won the #{item.name}"  
#   else
#     puts "Sorry, you didn't win the #{item}! Try being richer next time."
#   end

binding.pry
puts 'hi'