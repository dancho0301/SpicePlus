require 'rails_helper'

describe "spices/index" do
  before(:each) do
    assign(:spices, [
      stub_model(Spice,
        :name => "Name",
        :css_class => "Css Class"
      ),
      stub_model(Spice,
        :name => "Name",
        :css_class => "Css Class"
      )
    ])
  end

  it "renders a list of spices" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Css Class".to_s, :count => 2
  end
end
