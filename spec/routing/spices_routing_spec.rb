require "rails_helper"

describe SpicesController do
  describe "routing" do

    it "routes to #index" do
      expect(get("/spices")).to route_to("spices#index")
    end

    it "routes to #new" do
      expect(get("/spices/new")).to route_to("spices#new")
    end

    it "routes to #show" do
      expect(get("/spices/1")).to route_to("spices#show", :id => "1")
    end

    it "routes to #edit" do
      expect(get("/spices/1/edit")).to route_to("spices#edit", :id => "1")
    end

    it "routes to #create" do
      expect(post("/spices")).to route_to("spices#create")
    end

    it "routes to #update" do
      expect(put("/spices/1")).to route_to("spices#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete("/spices/1")).to route_to("spices#destroy", :id => "1")
    end

  end
end
