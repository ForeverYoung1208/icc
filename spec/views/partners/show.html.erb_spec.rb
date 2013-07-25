require 'spec_helper'

describe "partners/show" do
  before(:each) do
    @partner = assign(:partner, stub_model(Partner,
      :name => "",
      :site => "Site"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Site/)
  end
end
