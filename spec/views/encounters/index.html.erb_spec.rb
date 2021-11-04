require 'rails_helper'

RSpec.describe "encounters/index", type: :view do
  before(:each) do
    assign(:encounters, [
      Encounter.create!(
        recruit: nil,
        notes: "MyText"
      ),
      Encounter.create!(
        recruit: nil,
        notes: "MyText"
      )
    ])
  end

  it "renders a list of encounters" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
