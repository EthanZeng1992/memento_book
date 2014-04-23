require 'spec_helper'

describe School do

  it "should create a new instance given a valid attributes" do
    expect(build(:school, :user => build(:user))).to be_valid
  end

  describe "Association" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:groups) }
  end

  describe "Validation" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:user_id) }
    it { is_expected.to validate_presence_of(:user_id) }
  end
end
