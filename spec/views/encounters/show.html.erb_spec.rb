require 'rails_helper'

RSpec.describe "encounters/show", type: :view do
  before(:each) do
    @encounter = assign(:encounter, Encounter.create!(
      recruit: nil,
      notes: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
