require "spec_helper"

describe SpicesController do
  describe "routing" do

    it "routes to #index" do
      get("/spices").should route_to("spices#index")
    end

    it "routes to #new" do
      get("/spices/new").should route_to("spices#new")
    end

    it "routes to #show" do
      get("/spices/1").should route_to("spices#show", :id => "1")
    end

    it "routes to #edit" do
      get("/spices/1/edit").should route_to("spices#edit", :id => "1")
    end

    it "routes to #create" do
      post("/spices").should route_to("spices#create")
    end

    it "routes to #update" do
      put("/spices/1").should route_to("spices#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/spices/1").should route_to("spices#destroy", :id => "1")
    end

  end
end
