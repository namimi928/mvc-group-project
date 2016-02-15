describe 'Bid' do
  # let(:tim) {Buyer.new("Tim")}
  let(:new_bid) {Bid.new(49)}
  describe '#initialize' do
    it "can initialize a new Bid with an amount" do
      expect(new_bid.amount).to eq(49)
      
    end
  end
end