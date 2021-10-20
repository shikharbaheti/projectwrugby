require 'rails_helper'

RSpec.describe "merchandises/new", type: :view do
  before(:each) do
    assign(:merchandise, Merchandise.new(
      item_name: "MyString",
      purchase_price: 1,
      quantity_on_hande: 1,
      sell_price: 1
    ))
  end

  it "renders new merchandise form" do
    render

    assert_select "form[action=?][method=?]", merchandises_path, "post" do

      assert_select "input[name=?]", "merchandise[item_name]"

      assert_select "input[name=?]", "merchandise[purchase_price]"

      assert_select "input[name=?]", "merchandise[quantity_on_hande]"

      assert_select "input[name=?]", "merchandise[sell_price]"
    end
  end
end
