require 'rails_helper'

RSpec.describe "attendancerecords/show", type: :view do
  before(:each) do
    @attendancerecord = assign(:attendancerecord, Attendancerecord.create!(
      note: "MyText",
      attendancetype: "Attendancetype"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Attendancetype/)
  end
end
