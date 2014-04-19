require 'spec_helper'

describe "users/new" do
  include Authlogic::TestCase
  before(:each) do
    activate_authlogic
    assign(:user, User.new)
  end

  it "renders the edit form" do
    render 
    expect(rendered).to have_selector("form[action='#{create_user_path}']")
    expect(rendered).to have_selector("label[for='user_username']")
    expect(rendered).to have_selector("input[id='user_username']")
    expect(rendered).to have_selector("label[for='user_email']")
    expect(rendered).to have_selector("input[id='user_email']")
    expect(rendered).to have_selector("label[for='user_password']")
    expect(rendered).to have_selector("input[id='user_password']")
    expect(rendered).to have_selector("label[for='user_password_confirmation']")
    expect(rendered).to have_selector("input[id='user_password_confirmation']")
    expect(rendered).to have_selector("input[name='commit']")
  end
end
