require 'rails_helper'

RSpec.describe "recruits/new", type: :view do
  before(:each) do
    assign(:recruit, Recruit.new(
      contact_type: "MyString",
      interest_level: 1,
      times_contacted: 1
    ))
  end

  it "renders new recruit form" do
    render

    assert_select "form[action=?][method=?]", recruits_path, "post" do

      assert_select "input[name=?]", "recruit[contact_type]"

      assert_select "input[name=?]", "recruit[interest_level]"

      assert_select "input[name=?]", "recruit[times_contacted]"
    end
  end
end
