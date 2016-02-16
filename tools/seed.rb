items = ["The Mona Lisa", "Donald Trump's Twitter Account", "The Holy Grail", "Jeff Katz Autograph"]
buyers = ["Joe", "Nancy"]

items.each do |item|
  Item.new(item)
end

buyers.each do |buyer|
  Buyer.new(buyer)
end