require 'rails_helper'

RSpec.describe "attendancerecords/new", type: :view do
  before(:each) do
    assign(:attendancerecord, Attendancerecord.new(
      note: "MyText",
      attendancetype: "MyString"
    ))
  end

  it "renders new attendancerecord form" do
    render

    assert_select "form[action=?][method=?]", event_attendancerecords_path, "post" do

      assert_select "textarea[name=?]", "attendancerecord[note]"

      assert_select "input[name=?]", "attendancerecord[attendancetype]"
    end
  end
end
