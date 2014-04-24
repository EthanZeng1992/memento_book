require 'spec_helper'

describe "schools/index" do
  before(:each) do
    assign(:schools, School.all)
  end

  it 'renders [index] template' do
    render
    expect(rendered).to have_selector("div[id='school-title']")
    expect(rendered).to have_selector("a[href='#{new_school_path}']")
    expect(rendered).to have_selector("ul[class='school-list']")
  end
end
