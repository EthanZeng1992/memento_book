require 'spec_helper'

describe UsersController do
  describe "responding to GET new" do
    it "should expose a new user as @user and render [new] template" do
      @user = FactoryGirl.build(:user)
      expect(User).to receive(:new).and_return(@user)

      get :new
      expect(assigns[:user]).to eq(@user)
      expect(response).to render_template("users/new")
    end
  end

  describe "responding to POST create" do
    it "with valid params, should flash success and redirect to profile path" do
      post :create, :user => { 
        :username => "username",
        :email    => "username@example.com",
        :password => "password",
        :password_confirmation => "password"}

      expect(flash[:notice]).to eq("Successful registration.")
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
  end

  describe "responding to Get show" do
    before(:each) do
      require_user
    end

    it "should render [show] template" do
      get :show, :id => current_user.id
      expect(assigns[:user]).to eq(current_user)
      expect(response).to render_template("users/show")
    end
  end

  describe "responding to GET edit" do
    it "should expose current user as @user and render [edit] template" do
      require_user
      @user = current_user
      get :edit, :id => @user.id
      expect(assigns[:user]).to eq(current_user)
      expect(response).to render_template("users/edit")
    end
  end

  describe "responding to PUT update" do
    before(:each) do
      require_user
      @user = current_user
    end

    it "with valid params, should update user information and flash notice success then redirect to profile path" do
      put :update, :id => @user.id, :user => {
        :username => "golden",
        :email    => "golden@gmail.com"
      }

      @user.reload
      expect(@user.username).to eq("golden")
      expect(@user.email).to eq("golden@gmail.com")
      expect(assigns[:user]).to eq(@user)
      expect(flash[:notice]).to eq("Your user profile has been updated.")
      expect(response).to redirect_to(profile_path)
    end

    it "with invalid params, should not update the user information and redraw [edit] template" do
      put :update, :id => @user.id, :user => {
        :username => "",
        :email    => "" 
      }

      @user.reload
      expect(@user.username).to eq(current_user.username)
      expect(@user.email).to eq(current_user.email)
      expect(assigns[:user]).to eq(@user)
      expect(response).to render_template("users/edit")
    end
  end
end
