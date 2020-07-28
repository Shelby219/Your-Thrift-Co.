require "rails_helper"

RSpec.describe ShoppingBagsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/shopping_bags").to route_to("shopping_bags#index")
    end

    it "routes to #new" do
      expect(get: "/shopping_bags/new").to route_to("shopping_bags#new")
    end

    it "routes to #show" do
      expect(get: "/shopping_bags/1").to route_to("shopping_bags#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/shopping_bags/1/edit").to route_to("shopping_bags#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/shopping_bags").to route_to("shopping_bags#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/shopping_bags/1").to route_to("shopping_bags#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/shopping_bags/1").to route_to("shopping_bags#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/shopping_bags/1").to route_to("shopping_bags#destroy", id: "1")
    end
  end
end
