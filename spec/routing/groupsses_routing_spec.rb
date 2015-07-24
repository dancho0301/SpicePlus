require "spec_helper"

describe GroupssesController do
  describe "routing" do

    it "routes to #index" do
      get("/groupsses").should route_to("groupsses#index")
    end

    it "routes to #new" do
      get("/groupsses/new").should route_to("groupsses#new")
    end

    it "routes to #show" do
      get("/groupsses/1").should route_to("groupsses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/groupsses/1/edit").should route_to("groupsses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/groupsses").should route_to("groupsses#create")
    end

    it "routes to #update" do
      put("/groupsses/1").should route_to("groupsses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/groupsses/1").should route_to("groupsses#destroy", :id => "1")
    end

  end
end
