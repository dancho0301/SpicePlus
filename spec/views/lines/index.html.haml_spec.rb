require 'rails_helper'

describe "lines/index" do
  before(:each) do
    assign(:lines, [
      stub_model(Line,
        :name => "Name"
      ),
      stub_model(Line,
        :name => "Name"
      )
    ])
  end

  it "renders a list of lines" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
