require 'rails_helper'

RSpec.describe "rugbyhelps/index", type: :view do
  before(:each) do
    assign(:rugbyhelps, [
      Rugbyhelp.create!(),
      Rugbyhelp.create!()
    ])
  end

  it "renders a list of rugbyhelps" do
    render
  end
end
