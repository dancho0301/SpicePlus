require "spec_helper"

describe GroupssesController do
  describe "routing" do

    it "routes to #index" do
      expect(get("/groupsses")).to route_to("groupsses#index")
    end

    it "routes to #new" do
      expect(get("/groupsses/new")).to route_to("groupsses#new")
    end

    it "routes to #show" do
      expect(get("/groupsses/1")).to route_to("groupsses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(get("/groupsses/1/edit")).to route_to("groupsses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(post("/groupsses")).to route_to("groupsses#create")
    end

    it "routes to #update" do
      expect(put("/groupsses/1")).to route_to("groupsses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete("/groupsses/1")).to route_to("groupsses#destroy", :id => "1")
    end

  end
end
