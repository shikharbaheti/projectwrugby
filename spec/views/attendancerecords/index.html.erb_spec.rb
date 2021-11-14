require 'rails_helper'

RSpec.describe "attendancerecords/index", type: :view do
  before(:each) do
    assign(:attendancerecords, [
      Attendancerecord.create!(
        note: "MyText",
        attendancetype: "Attendancetype"
      ),
      Attendancerecord.create!(
        note: "MyText",
        attendancetype: "Attendancetype"
      )
    ])
  end

  it "renders a list of attendancerecords" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Attendancetype".to_s, count: 2
  end
end
