require 'rails_helper'

RSpec.describe "merchandises/show", type: :view do
  before(:each) do
    @merchandise = assign(:merchandise, Merchandise.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
