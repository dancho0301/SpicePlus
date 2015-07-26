require 'spec_helper'

describe "reports/index" do
  before(:each) do
    assign(:reports, [
      stub_model(Report,
        :article_id => "Article",
        :name => "Name",
        :title => "Title",
        :report_date => "Report Date",
        :article => "Article",
        :signature => "Signature",
        :spice_id => "Spice"
      ),
      stub_model(Report,
        :article_id => "Article",
        :name => "Name",
        :title => "Title",
        :report_date => "Report Date",
        :article => "Article",
        :signature => "Signature",
        :spice_id => "Spice"
      )
    ])
  end

  it "renders a list of reports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Article".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Report Date".to_s, :count => 2
    assert_select "tr>td", :text => "Article".to_s, :count => 2
    assert_select "tr>td", :text => "Signature".to_s, :count => 2
    assert_select "tr>td", :text => "Spice".to_s, :count => 2
  end
end
