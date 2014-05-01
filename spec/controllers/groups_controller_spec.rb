require 'spec_helper'

describe GroupsController do
  describe "responding to GET new" do
    it "if there is current user, should expose a new group as @group and render [new] template" do
      require_user
      @school = create(:school, user_id: current_user.id)
      @group = create(:group, school_id: @school.id)

      expect(Group).to receive(:new).and_return(@group)

      xhr :get, :new
      expect(assigns[:group]).to eq(@group)
      expect(response).to render_template("groups/new")
    end

    it "if there is no current user, should redirect to login path and flash 'You must login'" do
      get :new
      expect(flash[:warning]).to eq("You must login !")
      expect(response).to redirect_to(login_path)
    end
  end

  describe "responging to POST create" do
    it "if there is current user, should expose a newly group as @group" do
      require_user 
      @school = create(:school, user_id: current_user.id)
      @group = create(:group, school_id: @school.id)
      expect(Group).to receive(:new).and_return(@group)

      xhr :post, :create, :group => { name: @group.name} 
      expect(assigns[:group]).to eq(@group)
      expect(response).to render_template("groups/create")
    end

    it "if there is no current user, should redirect to login path and flash 'You must login'" do
      xhr :post, :create, :group=> { name: 'example name'} 

      expect(flash[:warning]).to eq("You must login !")
      expect(response).to redirect_to(login_path)
    end
  end
end
