require 'spec_helper'

describe "reports/show" do
  before(:each) do
    @report = assign(:report, stub_model(Report,
      :article_id => "Article",
      :name => "Name",
      :title => "Title",
      :report_date => "Report Date",
      :article => "Article",
      :signature => "Signature",
      :spice_id => "Spice"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Article/)
    rendered.should match(/Name/)
    rendered.should match(/Title/)
    rendered.should match(/Report Date/)
    rendered.should match(/Article/)
    rendered.should match(/Signature/)
    rendered.should match(/Spice/)
  end
end
