require 'spec_helper'

describe "genres/index" do
  before(:each) do
    assign(:genres, [
      stub_model(Genre,
        :name => "Name",
        :css_class => "Css Class"
      ),
      stub_model(Genre,
        :name => "Name",
        :css_class => "Css Class"
      )
    ])
  end

  it "renders a list of genres" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Css Class".to_s, :count => 2
  end
end
