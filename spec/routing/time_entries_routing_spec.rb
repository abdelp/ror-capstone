require "rails_helper"

RSpec.describe TimeEntriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/time_entries").to route_to("time_entries#index")
    end

    it "routes to #new" do
      expect(get: "/time_entries/new").to route_to("time_entries#new")
    end

    it "routes to #show" do
      expect(get: "/time_entries/1").to route_to("time_entries#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/time_entries/1/edit").to route_to("time_entries#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/time_entries").to route_to("time_entries#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/time_entries/1").to route_to("time_entries#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/time_entries/1").to route_to("time_entries#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/time_entries/1").to route_to("time_entries#destroy", id: "1")
    end
  end
end
