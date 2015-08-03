require 'rails_helper'

describe StaticPagesController do

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      expect(response).to be_success
    end
  end

  describe "GET 'recruitment'" do
    it "returns http success" do
      get 'recruitment'
      expect(response).to be_success
    end
  end

end
