require 'spec_helper'

describe "schools/new" do

  before(:each) do
    assign(:school, School.new)
  end

  it "renders the new form" do
    render
    expect(rendered).to have_selector("form[action='#{schools_path}']")
    expect(rendered).to have_selector("label[for='school_name']")
    expect(rendered).to have_selector("input[id='school_name']")
    expect(rendered).to have_selector("input[name='commit']")
  end
end
