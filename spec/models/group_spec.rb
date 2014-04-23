require 'spec_helper'

describe Group do

  it "should create a new instance given a valid attributes" do
    expect(build(:group, :school => build(:school))).to be_valid
  end

  describe "Association" do
    it { is_expected.to belong_to(:school) }
  end

  describe "Validation" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:school_id) }
    it { is_expected.to validate_presence_of(:school_id) }
  end

end
