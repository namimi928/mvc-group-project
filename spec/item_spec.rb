describe 'Item' do
  let(:mona_lisa) {Item.new("Mona Lisa")}
  describe '#initialize' do
    it "can initialize a new item with a name" do
      expect(mona_lisa.name). to eq("Mona Lisa")
    end
  end
  describe '#bids' do
    it "initializes with an empty array of bids" do
      expect(mona_lisa.bids).to eq([])
    end
  end
end