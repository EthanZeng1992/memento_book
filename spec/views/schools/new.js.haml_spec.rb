require 'spec_helper'

describe "/schools/new" do

  before do
    assign(:school, School.new)
  end

  describe "new school" do
    it "should render [new] template into #add:div" do
      params[:cancel] = 'false' 
      render

      expect(rendered).to include("#add")
    end
  end
end
