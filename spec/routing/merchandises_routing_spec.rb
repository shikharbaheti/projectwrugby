require "rails_helper"

RSpec.describe MerchandisesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/merchandises").to route_to("merchandises#index")
    end

    it "routes to #new" do
      expect(get: "/merchandises/new").to route_to("merchandises#new")
    end

    it "routes to #show" do
      expect(get: "/merchandises/1").to route_to("merchandises#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/merchandises/1/edit").to route_to("merchandises#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/merchandises").to route_to("merchandises#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/merchandises/1").to route_to("merchandises#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/merchandises/1").to route_to("merchandises#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/merchandises/1").to route_to("merchandises#destroy", id: "1")
    end
  end
end
