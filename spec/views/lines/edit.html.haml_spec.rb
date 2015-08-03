require 'rails_helper'

describe "lines/edit" do
  before(:each) do
    @line = assign(:line, stub_model(Line,
      :name => "MyString"
    ))
  end

  it "renders the edit line form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", line_path(@line), "post" do
      assert_select "input#line_name[name=?]", "line[name]"
    end
  end
end
