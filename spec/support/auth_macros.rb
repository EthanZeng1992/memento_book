def login(user_stubs = {}, session_stubs = {})
  @current_user = create(:user, user_stubs)
  @current_user_session = double(UserSession, {:user => current_user}.merge(session_stubs))
  expect(UserSession).to receive(:find).and_return(@current_user_session)
end
alias :require_user :login

#------------------------------------------------------------------------------------------
def current_user
  @current_user
end
