require 'rails_helper'

RSpec.describe "recruits/index", type: :view do
  before(:each) do
    assign(:recruits, [
      Recruit.create!(
        contact_type: "Contact Type",
        interest_level: 2,
        times_contacted: 3
      ),
      Recruit.create!(
        contact_type: "Contact Type",
        interest_level: 2,
        times_contacted: 3
      )
    ])
  end

  it "renders a list of recruits" do
    render
    assert_select "tr>td", text: "Contact Type".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
