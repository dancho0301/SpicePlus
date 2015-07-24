require 'spec_helper'

describe "groups/show" do
  before(:each) do
    @group = assign(:group, stub_model(Group,
      :name => "Name",
      :master_name => "Master Name",
      :address => "Address",
      :tel => "Tel",
      :url => "Url",
      :mail => "Mail",
      :activity => "Activity",
      :detail => "Detail"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Master Name/)
    rendered.should match(/Address/)
    rendered.should match(/Tel/)
    rendered.should match(/Url/)
    rendered.should match(/Mail/)
    rendered.should match(/Activity/)
    rendered.should match(/Detail/)
  end
end
