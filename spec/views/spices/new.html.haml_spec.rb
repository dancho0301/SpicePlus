require 'rails_helper'

describe "spices/new" do
  before(:each) do
    assign(:spice, stub_model(Spice,
      :name => "MyString",
      :css_class => "MyString"
    ).as_new_record)
  end

  it "renders new spice form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", spices_path, "post" do
      assert_select "input#spice_name[name=?]", "spice[name]"
      assert_select "input#spice_css_class[name=?]", "spice[css_class]"
    end
  end
end
