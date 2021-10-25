require 'rails_helper'

RSpec.describe "merchandises/show", type: :view do
  before(:each) do
    @merchandise = assign(:merchandise, Merchandise.create!(
      item_name: "Item Name",
      purchase_price: 2,
      quantity_on_hande: 3,
      sell_price: 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Item Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
