class BuyerController

  def prompt_buyer_creation
    view = BuyerView.new
    view.render_new_buyer
  end

  def list_buyers
    view = BuyerView.new
    view.render_buyer_list
    puts Buyer.list_buyer_names
  end

  def create(buyer_name)
    buyer = Buyer.new(buyer_name)
    puts "Hello, #{buyer.name}. You have successfully registered as a buyer."
  end

  
end