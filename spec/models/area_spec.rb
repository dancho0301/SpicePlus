require 'spec_helper'

describe Area do
  describe "when name" do
    it "name is not null" do
      area = Area.new
      area.name = nil
      expect(area).not_to be_valid
    end

    it "should max 20bytes" do
      area = Area.new
      area.name = "横浜市 戸塚区"

      expect(area).to be_valid
    end

    it "should not 21bytes" do
      area = Area.new
      area.name = "１２３４５６７８９０１"

      expect(area).not_to be_valid
    end
  end
end
