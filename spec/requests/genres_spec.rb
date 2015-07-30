require 'spec_helper'

describe "Genres" do
  describe "GET /genres" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get genres_path
      expect(response.status).to be(200)
    end
  end
end
