require "spec_helper"

describe UserSessionsController do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/login").to route_to("user_sessions#new")
    end

    it "routes to #create" do
      expect(:post => "/create_session").to route_to("user_sessions#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/logout").to route_to("user_sessions#destroy")
    end

  end
end
