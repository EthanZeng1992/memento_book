require 'spec_helper'

describe Group do

  it "should create a new instance given a valid attributes" do
    expect(FactoryGirl.build :group, :school => FactoryGirl.build(:school)).to be_valid
  end

  describe "Association" do
    it { should belong_to(:school) }
  end

  describe "Validation" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:school_id) }
    it { should validate_presence_of(:school_id) }
  end

end
