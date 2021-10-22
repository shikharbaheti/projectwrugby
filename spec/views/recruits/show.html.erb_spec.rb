require 'rails_helper'

RSpec.describe "recruits/show", type: :view do
  before(:each) do
    @recruit = assign(:recruit, Recruit.create!(
      contact_type: "Contact Type",
      interest_level: 2,
      times_contacted: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Contact Type/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
