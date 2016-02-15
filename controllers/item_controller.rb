class ItemController

  def create_new_item
    puts "Thank you for visiting, #{buyer.name}! \nWhat item would you like to bid on?"
    item_name = gets.chomp
    item = Item.new(item_name)
  end

  def list_items
    view = ItemView.new
    view.render_item_list
    puts Item.list_item_names
  end
end