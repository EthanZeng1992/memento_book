require 'spec_helper'

describe "passwords/new" do
  before(:each) do
    assign(:password, stub_model(Password).as_new_record)
  end
end
