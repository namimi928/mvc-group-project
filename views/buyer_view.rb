class BuyerView
  def render_new_buyer
    puts "Please enter your name."
    name = gets.chomp
  end

  def render_buyer_list
    str = "Registered Buyers"
    puts "\n"
    puts str
    puts "-" * str.length
  end

end