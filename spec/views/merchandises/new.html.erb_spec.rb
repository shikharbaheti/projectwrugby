require 'rails_helper'

RSpec.describe "merchandises/new", type: :view do
  before(:each) do
    assign(:merchandise, Merchandise.new(
      name: "MyString"
    ))
  end

  it "renders new merchandise form" do
    render

    assert_select "form[action=?][method=?]", merchandises_path, "post" do

      assert_select "input[name=?]", "merchandise[name]"
    end
  end
end
