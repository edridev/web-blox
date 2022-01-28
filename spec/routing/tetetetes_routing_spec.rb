require "rails_helper"

RSpec.describe TetetetesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/tetetetes").to route_to("tetetetes#index")
    end

    it "routes to #new" do
      expect(get: "/tetetetes/new").to route_to("tetetetes#new")
    end

    it "routes to #show" do
      expect(get: "/tetetetes/1").to route_to("tetetetes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/tetetetes/1/edit").to route_to("tetetetes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/tetetetes").to route_to("tetetetes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/tetetetes/1").to route_to("tetetetes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/tetetetes/1").to route_to("tetetetes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/tetetetes/1").to route_to("tetetetes#destroy", id: "1")
    end
  end
end
