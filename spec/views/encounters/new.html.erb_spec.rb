require 'rails_helper'

RSpec.describe "encounters/new", type: :view do
  before(:each) do
    assign(:encounter, Encounter.new(
      recruit: nil,
      notes: "MyText"
    ))
  end

  it "renders new encounter form" do
    render

    assert_select "form[action=?][method=?]", encounters_path, "post" do

      assert_select "input[name=?]", "encounter[recruit_id]"

      assert_select "textarea[name=?]", "encounter[notes]"
    end
  end
end
