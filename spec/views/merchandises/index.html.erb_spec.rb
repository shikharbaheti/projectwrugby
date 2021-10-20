require 'rails_helper'

RSpec.describe "merchandises/index", type: :view do
  before(:each) do
    assign(:merchandises, [
      Merchandise.create!(
        item_name: "Item Name",
        purchase_price: 2,
        quantity_on_hande: 3,
        sell_price: 4
      ),
      Merchandise.create!(
        item_name: "Item Name",
        purchase_price: 2,
        quantity_on_hande: 3,
        sell_price: 4
      )
    ])
  end

  it "renders a list of merchandises" do
    render
    assert_select "tr>td", text: "Item Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
  end
end
