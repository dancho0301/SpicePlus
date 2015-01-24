require 'spec_helper'

describe StaticPagesController do

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'recruitment'" do
    it "returns http success" do
      get 'recruitment'
      response.should be_success
    end
  end

end
