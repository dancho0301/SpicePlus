require 'rails_helper'

describe "groupsses/new" do
  before(:each) do
    assign(:groupss, stub_model(Groupss,
      :name => "MyString",
      :master_name => "MyString",
      :address => "MyString",
      :tel => "MyString",
      :url => "MyString",
      :mail => "MyString",
      :activity => "MyString",
      :detail => "MyString"
    ).as_new_record)
  end

  it "renders new groupss form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", groupsses_path, "post" do
      assert_select "input#groupss_name[name=?]", "groupss[name]"
      assert_select "input#groupss_master_name[name=?]", "groupss[master_name]"
      assert_select "input#groupss_address[name=?]", "groupss[address]"
      assert_select "input#groupss_tel[name=?]", "groupss[tel]"
      assert_select "input#groupss_url[name=?]", "groupss[url]"
      assert_select "input#groupss_mail[name=?]", "groupss[mail]"
      assert_select "input#groupss_activity[name=?]", "groupss[activity]"
      assert_select "input#groupss_detail[name=?]", "groupss[detail]"
    end
  end
end
