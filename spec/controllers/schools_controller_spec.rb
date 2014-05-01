require 'spec_helper'

describe SchoolsController do

  describe "responging to GET new" do
    it "if there is current user, should expose a new school as @school and render [new] template" do
      require_user
      @school = create(:school, user_id: current_user.id)

      expect(School).to receive(:new).and_return(@school)

      xhr :get, :new
      expect(assigns[:school]).to eq(@school)
      expect(response).to render_template("schools/new")
    end

    it "if there is no current user, should redirect to login path and flash 'You must login'" do
      get :new
      expect(flash[:warning]).to eq("You must login !")
      expect(response).to redirect_to(login_path)
    end
  end

  describe "responging to POST create" do
    it "if there is current user, should expose a newly school as @school" do
      require_user 
      @school = create(:school, user_id: current_user.id)
      expect(School).to receive(:new).and_return(@school)

      xhr :post, :create, :school => { name: @school.name} 
      expect(assigns[:school]).to eq(@school)
      expect(response).to render_template("schools/create")
    end

    it "if there is no current user, should redirect to login path and flash 'You must login'" do
      xhr :post, :create, :school => { name: 'example name'} 

      expect(flash[:warning]).to eq("You must login !")
      expect(response).to redirect_to(login_path)
    end
  end

  describe "responging to GET index" do
    it "if there is current user, should expose all schools as @schools and render [index] template" do
      require_user 
      school1 = create(:school, user_id: current_user.id)
      school2 = create(:school, user_id: current_user.id)

      get :index
      expect(assigns[:schools]).to eq([school2, school1])
      expect(response).to render_template("schools/index")
    end

    it "if there is no current user, should redirect to login path and flash 'You must login'" do
      get :index
      expect(flash[:warning]).to eq("You must login !")
      expect(response).to redirect_to(login_path)
    end
  end
end
