require "rails_helper"

RSpec.describe AttendancerecordsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/attendancerecords").to route_to("attendancerecords#index")
    end

    it "routes to #new" do
      expect(get: "/attendancerecords/new").to route_to("attendancerecords#new")
    end

    it "routes to #show" do
      expect(get: "/attendancerecords/1").to route_to("attendancerecords#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/attendancerecords/1/edit").to route_to("attendancerecords#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/attendancerecords").to route_to("attendancerecords#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/attendancerecords/1").to route_to("attendancerecords#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/attendancerecords/1").to route_to("attendancerecords#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/attendancerecords/1").to route_to("attendancerecords#destroy", id: "1")
    end
  end
end
