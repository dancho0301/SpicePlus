require 'rails_helper'

describe "reports/edit" do
  before(:each) do
    @report = assign(:report, stub_model(Report,
      :article_id => "MyString",
      :name => "MyString",
      :title => "MyString",
      :report_date => "MyString",
      :article => "MyString",
      :signature => "MyString",
      :spice_id => "MyString"
    ))
  end

  it "renders the edit report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", report_path(@report), "post" do
      assert_select "input#report_article_id[name=?]", "report[article_id]"
      assert_select "input#report_name[name=?]", "report[name]"
      assert_select "input#report_title[name=?]", "report[title]"
      assert_select "input#report_report_date[name=?]", "report[report_date]"
      assert_select "input#report_article[name=?]", "report[article]"
      assert_select "input#report_signature[name=?]", "report[signature]"
      assert_select "input#report_spice_id[name=?]", "report[spice_id]"
    end
  end
end
