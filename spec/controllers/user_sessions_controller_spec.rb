require 'spec_helper'

describe UserSessionsController do
  describe "responding to GET new" do
    it "should render [new] template" do
      get :new
      expect(response).to render_template("user_sessions/new")
    end

    it "if there exist current user session, should redirect to profile path and flash 'You have already logined!'" do
      login

      get :new
      expect(response).to redirect_to(profile_path)
      expect(flash[:info]).to eq("You have already logined!")
    end
  end

  describe "responding to POST create" do
    it "with valid params, should flash success and redirect to profile path" do
      @user = create(:user)
      post :create, :user_session => {
        :username => @user.username, 
        :password => @user.password}

      expect(flash[:success]).to eq("Login successfully!")
      expect(response).to redirect_to(profile_path)
    end

    it "with invalid params, shuld renders [new] template" do
      post :create, :user_session => {
        :username => "",
        :password => ""}

      expect(response).to render_template("user_sessions/new")
    end

    it "if there exist current user, should redirect to profile path and flash 'You have already logined!'" do
      login 
      post :create, :user_session => {
        :username => "username", 
        :password => "password"}

      expect(flash[:info]).to eq("You have already logined!")
      expect(response).to redirect_to(profile_path)
    end
  end

  describe "responding to DELETE destroy" do
    it "if there is no current user, should redirect to login path and flash logout notice" do
      delete :destroy 
      expect(flash[:warning]).to eq("You must login !")
      expect(response).to redirect_to(login_path)
    end
  end
end
