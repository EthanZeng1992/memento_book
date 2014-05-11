require 'spec_helper'

describe "schools/new" do

  before(:each) do
    assign(:school, School.new)
  end

  it "renders the new form" do
    render partial: 'schools/new'
    expect(rendered).to have_selector("a[id='return']")
    expect(rendered).to have_selector("i[class='fa fa-times fa-close']")
    expect(rendered).to have_selector("form[action='#{schools_path}']")
  end
end
