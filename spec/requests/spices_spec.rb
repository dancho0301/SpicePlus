require 'spec_helper'

describe "Spices" do
  describe "GET /spices" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get spices_path
      response.status.should be(200)
    end
  end
end
