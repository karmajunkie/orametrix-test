require 'spec_helper'

describe Hotel do
  let(:hotel){ Factory(:hotel) }

  describe "validations" do
    it "is valid" do
      hotel.should be_valid
    end
    it "has a name" do
      hotel.name = ""
      hotel.should_not be_valid
    end
    it "has an address" do
      hotel.address = ""
      hotel.should_not be_valid
    end
    it "has a description" do
      hotel.description = ""
      hotel.should_not be_valid
    end
    it "has a rate" do
      hotel.rate = nil
      hotel.should_not be_valid
    end
    it "requires a numeric rate" do
      hotel.rate = "this is not a number"
      hotel.should_not be_valid
    end

    it "has a city" do
      debugger
      hotel.city=nil
      hotel.should_not be_valid
    end
  end

  describe "scopes" do
    describe "rated" do
      it "only returns hotels rated at or higher than the given value" do
        bad_hotel = Factory(:hotel, :star_rating => 1)
        good_hotel = Factory(:hotel, :star_rating => 2)
        hotels = Hotel.rated(2)
        hotels.should include(good_hotel)
        hotels.should_not include(bad_hotel)
      end
    end
  end


end