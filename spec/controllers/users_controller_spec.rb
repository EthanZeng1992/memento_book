require 'spec_helper'

describe UsersController do
  describe "responding to GET new" do
    it "should expose a new user as @user and render [new] template" do
      @user = build(:user)
      expect(User).to receive(:new).and_return(@user)

      get :new
      expect(assigns[:user]).to eq(@user)
      expect(response).to render_template("users/new")
    end

    it "if there exist current user, should redirect to profile path and flash 'You must logout',  when logout, it should redirect to signup path"do
      login 

      get :new
      expect(response).to redirect_to(profile_path)
      expect(flash[:warning]).to eq("You must logout!")
    end
  end

  describe "responding to POST create" do
    it "with valid params, should flash success and redirect to profile path" do
      post :create, :user => { 
        :username => "username",
        :email    => "username@example.com",
        :password => "password",
        :password_confirmation => "password"}

      expect(flash[:info]).to eq("Successful registration.")
      expect(response).to redirect_to(profile_path)
    end

    it "with invalid params, shuld renders [new] template" do
      post :create, :user => {
        :username => "",
        :email    => "",
        :password => "",
        :password_confirmation => ""}

      expect(response).to render_template("users/new")
    end

    it "if there exist current user, should redirect to profile path and flash 'You must logout'" do
      login 

      post :create, :user => { 
        :username => "username",
        :email    => "username@example.com",
        :password => "password",
        :password_confirmation => "password"}

      expect(flash[:warning]).to eq("You must logout!")
      expect(response).to redirect_to(profile_path)
    end
  end

  describe "responding to Get show" do
    it "should render [show] template" do
      require_user

      get :show
      expect(assigns[:user]).to eq(current_user)
      expect(response).to render_template("users/show")
    end

    it "if there no current user exist, should redirect to login path and flash 'You must login'" do
      get :show
      expect(flash[:warning]).to eq("You must login !")
      expect(response).to redirect_to(login_path)
    end
  end

  describe "responding to GET edit" do
    it "should expose current user as @user and render [edit] template" do
      require_user
      get :edit
      expect(assigns[:user]).to eq(current_user)
      expect(response).to render_template("users/edit")
    end

    it "if there no current user exist, should redirect to login path and flash 'You must login'" do
      get :edit
      expect(flash[:warning]).to eq("You must login !")
      expect(response).to redirect_to(login_path)
    end
  end

  describe "responding to PUT update" do
    it "with valid params, should update user information and flash notice success then redirect to profile path" do
      require_user
      @user = current_user

      put :update, :user => {
        :username => "golden",
        :email    => "golden@gmail.com"
      }

      @user.reload
      expect(@user.username).to eq("golden")
      expect(@user.email).to eq("golden@gmail.com")
      expect(assigns[:user]).to eq(@user)
      expect(flash[:info]).to eq("Your profile has been updated.")
      expect(response).to redirect_to(profile_path)
    end

    it "with invalid params, should not update the user information and redraw [edit] template" do
      require_user
      @user = current_user

      put :update, :user => {
        :username => "",
        :email    => "" 
      }

      @user.reload
      expect(@user.username).to eq(current_user.username)
      expect(@user.email).to eq(current_user.email)
      expect(assigns[:user]).to eq(@user)
      expect(response).to render_template("users/edit")
    end

    it "if there no current user exist, should redirect to login path and flash 'You must login'" do
      put :update, :user => {
        :username => "golden",
        :email    => "golden@gmail.com"
      }

      expect(flash[:warning]).to eq("You must login !")
      expect(response).to redirect_to(login_path)
    end
  end
end
