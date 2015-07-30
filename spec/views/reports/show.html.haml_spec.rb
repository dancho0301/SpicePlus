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
    expect(rendered).to match(/Article/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Report Date/)
    expect(rendered).to match(/Article/)
    expect(rendered).to match(/Signature/)
    expect(rendered).to match(/Spice/)
  end
end
