require 'rails_helper'

describe "lines/new" do
  before(:each) do
    assign(:line, stub_model(Line,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new line form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", lines_path, "post" do
      assert_select "input#line_name[name=?]", "line[name]"
    end
  end
end
