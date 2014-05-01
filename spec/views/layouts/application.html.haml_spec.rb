require 'spec_helper'

describe "layouts/application" do
  it "if there is no current user, should link to login and sign up" do
    render
    expect(rendered).to have_selector("a[href='#{login_path}']")
    expect(rendered).to have_selector("a[href='#{signup_path}']")
  end

  it "if there is current user, should link to profile, setting and logout" do
    @current_user = create(:user)
    @current_user_session = double(UserSession, {:user => current_user})

    render
    expect(rendered).to have_selector("a[href='#{profile_path}']")
    expect(rendered).to have_selector("a[href='#{edit_profile_path}']")
    expect(rendered).to have_selector("a[href='#{logout_path}']")
    expect(rendered).to have_selector("a[href='/add?cancel=false']")
  end
end
