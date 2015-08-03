require 'rails_helper'

describe "lines/show" do
  before(:each) do
    @line = assign(:line, stub_model(Line,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Name/)
  end
end
