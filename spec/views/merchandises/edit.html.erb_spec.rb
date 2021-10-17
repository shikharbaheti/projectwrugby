require 'rails_helper'

RSpec.describe "merchandises/edit", type: :view do
  before(:each) do
    @merchandise = assign(:merchandise, Merchandise.create!(
      name: "MyString"
    ))
  end

  it "renders the edit merchandise form" do
    render

    assert_select "form[action=?][method=?]", merchandise_path(@merchandise), "post" do

      assert_select "input[name=?]", "merchandise[name]"
    end
  end
end
