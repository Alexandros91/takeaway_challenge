require 'takeaway'


describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }
 
  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Chicken: £3.20" }
  it 'shows a list of dishes with prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end
end
