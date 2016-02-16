require 'pry'
class Auction
  attr_accessor :buyers, :items

  def initialize(buyers, items)
    @buyers = buyers
    @items  = items
  end


# Known issue:
# If first buyer does not bid and second buyer does, second buyer should win the item for whatever their bid was. Currently not working

  def start_bidding
    #i = 0
    until self.items.all? {|item| item.sold || !item.interest}
    #until i = self.items.count
      self.items.each do |item|
        puts "Next up for bidding: #{item.name}."
        puts "\n"

        reset_buyer_eligibility

        #high_bid = 0
        high_bidder = ""

        until winner? || no_interest
          self.buyers.each do |buyer|

            next if buyer.eligible == false

            # if earlier bidders drop out this ensures later buyers don't have to bid againe
            if !item.bids.empty? && item.bids.last.buyer == buyer
              break
            end

            puts "#{buyer.name}, do you want to place a bid? y/n"
            response = gets.chomp.downcase

            if response == 'y'
              puts "Enter bid amount greater than #{item.highest_bid}."
              bid = gets.chomp.to_i

              buyer.make_bid(bid, item)

              high_bidder = buyer.name

            elsif response == 'n'
              buyer.eligible = false
            end
          end

          break if winner? || no_interest
        end
        if winner?
          item.sold = true
          puts "Congratulations, #{high_bidder}! You won #{item.name} for $#{item.highest_bid}."
          puts "\n"
        elsif no_interest
          item.interest = false
          puts "All buyers have passed on #{item.name}."
          puts "\n"
        end
      end
    end
    remove_sold_items
    puts "That concludes the bidding!"
  end

  def winner?
    self.buyers.select {|buyer| buyer.eligible}.size == 1
  end

  def no_interest
    self.buyers.all? {|buyer| !buyer.eligible}
  end

  def reset_buyer_eligibility
    self.buyers.each {|buyer| buyer.eligible = true}
  end

  def remove_sold_items
    self.items.delete_if {|item| item.sold}
  end

end