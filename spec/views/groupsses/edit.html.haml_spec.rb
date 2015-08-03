require 'rails_helper'

describe "groupsses/edit" do
  before(:each) do
    @groupss = assign(:groupss, stub_model(Groupss,
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

  it "renders the edit groupss form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", groupss_path(@groupss), "post" do
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
