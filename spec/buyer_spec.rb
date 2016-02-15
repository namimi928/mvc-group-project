
describe 'Buyer' do

  let(:tim) {Buyer.new("Tim")}
  let(:item) {Item.new("Mona_Lisa")}

  describe '#initialize' do
    it "can initialize a new buyer with a name" do
      expect(tim.name).to eq("Tim")
    end
    it "initializes bids as an empty array" do
      expect(tim.bids).to eq([])
    end
  end
  describe "#make_bid" do
    it "creates a new bid" do
      tim.make_bid(50, item)
      expect(tim.bids.length).to eq(1)
    end
    it "associates a buyer with a bid"  do
      tim.make_bid(50, item)
      expect(tim.bids.last.buyer).to eq(tim)
    end
  end



end