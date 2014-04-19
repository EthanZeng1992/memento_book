require 'spec_helper'

describe "user_sessions/new" do
  include Authlogic::TestCase
  before(:each) do
    activate_authlogic
    assign(:user_session, UserSession.new)
  end

  it "renders the login form with signup link" do
    render
    expect(rendered).to have_selector("form[action='#{create_session_path}'][id='new_user_session']")
    expect(rendered).to have_selector("label[for='user_session_username']")
    expect(rendered).to have_selector("input[id='user_session_username']")
    expect(rendered).to have_selector("label[for='user_session_password']")
    expect(rendered).to have_selector("input[id='user_session_password']")
    expect(rendered).to have_selector("input[name='commit']")
    expect(rendered).to have_selector("a[href='#{signup_path}']")
  end
end
