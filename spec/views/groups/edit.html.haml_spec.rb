require 'spec_helper'

describe "groups/edit" do
  before(:each) do
    @group = assign(:group, stub_model(Group,
      :name => "MyString",
      :master_name => "MyString",
      :address => "MyString",
      :tel => "MyString",
      :url => "MyString",
      :mail => "MyString",
      :activity => "MyString",
      :detail => "MyString"
    ))
  end

  it "renders the edit group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", group_path(@group), "post" do
      assert_select "input#group_name[name=?]", "group[name]"
      assert_select "input#group_master_name[name=?]", "group[master_name]"
      assert_select "input#group_address[name=?]", "group[address]"
      assert_select "input#group_tel[name=?]", "group[tel]"
      assert_select "input#group_url[name=?]", "group[url]"
      assert_select "input#group_mail[name=?]", "group[mail]"
      assert_select "input#group_activity[name=?]", "group[activity]"
      assert_select "input#group_detail[name=?]", "group[detail]"
    end
  end
end
