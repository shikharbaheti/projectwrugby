require 'rails_helper'

RSpec.describe "attendancerecords/edit", type: :view do
  before(:each) do
    @attendancerecord = assign(:attendancerecord, Attendancerecord.create!(
      note: "MyText",
      attendancetype: "MyString"
    ))
  end

  it "renders the edit attendancerecord form" do
    render

    assert_select "form[action=?][method=?]", attendancerecord_path(@attendancerecord), "post" do

      assert_select "textarea[name=?]", "attendancerecord[note]"

      assert_select "input[name=?]", "attendancerecord[attendancetype]"
    end
  end
end
