require 'takeaway'


describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
 
  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { double(:order) }
  let(:printed_menu) { "Chicken: £3.20" }

  let(:dishes) { {chicken: 2, fish: 3} }
 
  describe '#print_menu' do
    it 'shows a list of dishes with prices' do
      expect(takeaway.print_menu).to eq(printed_menu)
    end
  end

  describe '#place_order' do
    it 'can order a number of several available dishes' do
      expect(order).to receive(:add).twice
      takeaway.place_order(dishes)
    end
  end
end
