require "rails_helper"

RSpec.describe RecruitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/recruits").to route_to("recruits#index")
    end

    it "routes to #new" do
      expect(get: "/recruits/new").to route_to("recruits#new")
    end

    it "routes to #show" do
      expect(get: "/recruits/1").to route_to("recruits#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/recruits/1/edit").to route_to("recruits#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/recruits").to route_to("recruits#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/recruits/1").to route_to("recruits#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/recruits/1").to route_to("recruits#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/recruits/1").to route_to("recruits#destroy", id: "1")
    end
  end
end
