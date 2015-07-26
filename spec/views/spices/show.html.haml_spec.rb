require 'spec_helper'

describe "spices/show" do
  before(:each) do
    @spice = assign(:spice, stub_model(Spice,
      :name => "Name",
      :css_class => "Css Class"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Css Class/)
  end
end
