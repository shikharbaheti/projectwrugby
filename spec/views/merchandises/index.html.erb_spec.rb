require 'rails_helper'

RSpec.describe "merchandises/index", type: :view do
  before(:each) do
    assign(:merchandises, [
      Merchandise.create!(
        name: "Name"
      ),
      Merchandise.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of merchandises" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
