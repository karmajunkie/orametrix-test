require 'spec_helper'

describe Trip do
  describe "validations" do
    let(:trip){Factory(:trip)}
    it "is valid" do
      trip.should be_valid
    end
    it "requires a name" do
      trip.name = nil
      trip.should_not be_valid
    end
  end
end
