require 'spec_helper'

describe SchoolsController do
  describe "responging to GET new" do
    it "if there is current user, should expose a new school as @school and render [new] template" do
      require_user

      @school = build(:school)
      expect(School).to receive(:new).and_return(@school)

      get :new
      expect(assigns[:school]).to eq(@school)
      expect(response).to render_template("schools/new")
    end

    it "if there is no current user, should redirect to login path and flash 'You must login'" do
      get :new
      expect(flash[:warning]).to eq("You must login !")
      expect(response).to redirect_to(login_path)
    end
  end
end
