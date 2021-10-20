require 'rails_helper'

RSpec.describe "merchandises/edit", type: :view do
  before(:each) do
    @merchandise = assign(:merchandise, Merchandise.create!(
      item_name: "MyString",
      purchase_price: 1,
      quantity_on_hande: 1,
      sell_price: 1
    ))
  end

  it "renders the edit merchandise form" do
    render

    assert_select "form[action=?][method=?]", merchandise_path(@merchandise), "post" do

      assert_select "input[name=?]", "merchandise[item_name]"

      assert_select "input[name=?]", "merchandise[purchase_price]"

      assert_select "input[name=?]", "merchandise[quantity_on_hande]"

      assert_select "input[name=?]", "merchandise[sell_price]"
    end
  end
end
