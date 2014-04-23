require 'spec_helper'

describe School do

  it "should create a new instance given a valid attributes" do
    expect(FactoryGirl.build :school, :user => FactoryGirl.build(:user)).to be_valid
  end

  describe "Association" do
    it { should belong_to(:user) }
    it { should have_many(:groups) }
  end

  describe "Validation" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:user_id) }
    it { should validate_presence_of(:user_id) }
  end
end
