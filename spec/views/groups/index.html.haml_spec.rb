require 'spec_helper'

describe "groups/index" do
  before(:each) do
    assign(:groups, [
      stub_model(Group,
        :name => "Name",
        :master_name => "Master Name",
        :address => "Address",
        :tel => "Tel",
        :url => "Url",
        :mail => "Mail",
        :activity => "Activity",
        :detail => "Detail"
      ),
      stub_model(Group,
        :name => "Name",
        :master_name => "Master Name",
        :address => "Address",
        :tel => "Tel",
        :url => "Url",
        :mail => "Mail",
        :activity => "Activity",
        :detail => "Detail"
      )
    ])
  end

  it "renders a list of groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Master Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Tel".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Mail".to_s, :count => 2
    assert_select "tr>td", :text => "Activity".to_s, :count => 2
    assert_select "tr>td", :text => "Detail".to_s, :count => 2
  end
end
