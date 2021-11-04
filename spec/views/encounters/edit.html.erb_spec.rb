require 'rails_helper'

RSpec.describe "encounters/edit", type: :view do
  before(:each) do
    @encounter = assign(:encounter, Encounter.create!(
      recruit: nil,
      notes: "MyText"
    ))
  end

  it "renders the edit encounter form" do
    render

    assert_select "form[action=?][method=?]", encounter_path(@encounter), "post" do

      assert_select "input[name=?]", "encounter[recruit_id]"

      assert_select "textarea[name=?]", "encounter[notes]"
    end
  end
end
