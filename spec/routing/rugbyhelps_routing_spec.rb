require "rails_helper"

RSpec.describe RugbyhelpsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/rugbyhelps").to route_to("rugbyhelps#index")
    end

    it "routes to #new" do
      expect(get: "/rugbyhelps/new").to route_to("rugbyhelps#new")
    end

    it "routes to #show" do
      expect(get: "/rugbyhelps/1").to route_to("rugbyhelps#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/rugbyhelps/1/edit").to route_to("rugbyhelps#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/rugbyhelps").to route_to("rugbyhelps#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/rugbyhelps/1").to route_to("rugbyhelps#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/rugbyhelps/1").to route_to("rugbyhelps#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/rugbyhelps/1").to route_to("rugbyhelps#destroy", id: "1")
    end
  end
end
