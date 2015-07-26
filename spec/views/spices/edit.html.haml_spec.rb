require 'spec_helper'

describe "spices/edit" do
  before(:each) do
    @spice = assign(:spice, stub_model(Spice,
      :name => "MyString",
      :css_class => "MyString"
    ))
  end

  it "renders the edit spice form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", spice_path(@spice), "post" do
      assert_select "input#spice_name[name=?]", "spice[name]"
      assert_select "input#spice_css_class[name=?]", "spice[css_class]"
    end
  end
end
