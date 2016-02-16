require 'pry'
class Auction
  attr_accessor :buyers, :items

  def initialize(buyers, items)
    @buyers = buyers
    @items  = items
  end

# # Known issue:
# # If first buyer does not bid and second buyer does, second buyer should win the item for whatever their bid was. Currently not working

  def run_auction
    start_bidding unless auction_over?
    remove_sold_items
  end

  def start_bidding
    items.each do |item|
      puts "Next up for bidding: #{item.name}."
      puts "\n"

      reset_buyer_eligibility

      until winner? || no_interest
        elicit_bids(item)
        break if winner? || no_interest
      end

      if winner?
        congratulate_winner(item.highest_bidder, item)
      elsif no_interest
        no_interest_in_item(item)
      end
    end
  end

  def elicit_bids(item)
    buyers.each do |buyer|
      next if buyer.eligible == false

      # if earlier bidders drop out this ensures later buyers don't have to bid again
      break if !item.bids.empty? && item.bids.last.buyer == buyer

      want_to_bid?(buyer, item)
    end
  end

  def want_to_bid?(buyer, item)
    puts "#{buyer.name}, do you want to place a bid? y/n"
    response = gets.chomp.downcase

    unless response == "y" || response == "n"
      puts "Invalid command. Please enter 'y' or 'n'."
      ask_for_bid(buyer)
    end

    if response == "y"
      get_bid(buyer, item)
    elsif response == "n"
      buyer.eligible = false
    end
  end

  def get_bid(buyer, item)
    puts "Enter bid amount of #{item.highest_bid + 1} or more."
    bid = gets.chomp.to_i
    if bid <= item.highest_bid
      puts "The minimum bid amount is #{item.highest_bid + 1}"
      get_bid(buyer, item)
    end
    buyer.make_bid(bid, item)
    item.highest_bidder = buyer.name
  end

  def winner?
    self.buyers.select {|buyer| buyer.eligible}.size == 1
  end

  def no_interest
    self.buyers.all? {|buyer| !buyer.eligible}
  end

  def congratulate_winner(name, item)
    item.sold = true
    puts "Congratulations, #{name}! You won #{item.name} for $#{item.highest_bid}."
    puts "\n"
  end

  def no_interest_in_item(item)
    item.interest = false
    puts "All buyers have passed on #{item.name}."
    puts "\n"
  end 

  def reset_buyer_eligibility
    self.buyers.each {|buyer| buyer.eligible = true}
  end

  def remove_sold_items
    self.items.delete_if {|item| item.sold}
  end

  # unsorted methods
  def auction_over?
    items.all? {|item| item.sold || !item.interest}
  end



end