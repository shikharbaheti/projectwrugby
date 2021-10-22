require 'rails_helper'

RSpec.describe "recruits/edit", type: :view do
  before(:each) do
    @recruit = assign(:recruit, Recruit.create!(
      contact_type: "MyString",
      interest_level: 1,
      times_contacted: 1
    ))
  end

  it "renders the edit recruit form" do
    render

    assert_select "form[action=?][method=?]", recruit_path(@recruit), "post" do

      assert_select "input[name=?]", "recruit[contact_type]"

      assert_select "input[name=?]", "recruit[interest_level]"

      assert_select "input[name=?]", "recruit[times_contacted]"
    end
  end
end
