require 'rails_helper'

describe "Areas" do
  describe "GET /areas" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get areas_path
      expect(response.status).to be(200)
    end
  end
end
