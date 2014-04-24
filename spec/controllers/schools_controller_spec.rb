require 'spec_helper'

describe SchoolsController do

  def mock_school(stubs = { :name => "Test School", :user => mock_model(User) })
    @mock_school ||= mock_model(School, stubs)
  end

  describe "responging to GET new" do
    it "if there is current user, should expose a new school as @school and render [new] template" do
      require_user
      expect(School).to receive(:new).and_return(mock_school)

      get :new
      expect(assigns[:school]).to eq(mock_school)
      expect(response).to render_template("schools/new")
    end

    it "if there is no current user, should redirect to login path and flash 'You must login'" do
      get :new
      expect(flash[:warning]).to eq("You must login !")
      expect(response).to redirect_to(login_path)
    end
  end

  describe "responging to GET index" do
    it "if there is current user, should expose all schools as @schools and render [show] template" do
      require_user 
      expect(School).to receive(:all).and_return(mock_school)

      get :index
      expect(assigns[:schools]).to eq(mock_school)
      expect(response).to render_template("schools/index")
    end

    it "if there is no current user, should redirect to login path and flash 'You must login'" do
      get :index
      expect(flash[:warning]).to eq("You must login !")
      expect(response).to redirect_to(login_path)
    end
  end
end
