require 'spec_helper'

describe "groupsses/show" do
  before(:each) do
    @groupss = assign(:groupss, stub_model(Groupss,
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
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Master Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Tel/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Mail/)
    expect(rendered).to match(/Activity/)
    expect(rendered).to match(/Detail/)
  end
end
