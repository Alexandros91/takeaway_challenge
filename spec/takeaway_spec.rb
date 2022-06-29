require 'takeaway'


describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order,
    sms: sms, config: {}) }
 
  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { instance_double("Order", total: 15.50) }
  let(:sms) { instance_double("SMS", deliver: nil) }
  let(:printed_menu) { "Chicken: £3.50" }

  let(:dishes) { {chicken: 2, fish: 3} }

  before do
    allow(order).to receive(:add)
  end
 
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

  describe '#total' do
    it 'knows the order total' do
      total = takeaway.place_order(dishes)
      expect(total).to eq(15.50)
    end
  end

  describe '#send_message' do
    it 'sends an SMS when the order has been placed' do
      expect(sms).to receive(:deliver)
      takeaway.place_order(dishes)
    end
  end
end
