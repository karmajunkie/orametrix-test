require 'spec_helper'

describe HotelsController do
  describe "#index" do
    before do
      @city = Factory(:city)
      @hotel1 = Factory(:hotel, :city => @city)
      @hotel2 = Factory(:hotel, :city => @city)
    end
    it "should assign all the hotels for the city" do
      get :index, :city_id => @city.id
      assigns(:hotels).should include(@hotel1)
      assigns(:hotels).should include(@hotel2)
      assigns(:hotels).count.should == 2
    end
    it "should not assign hotels for other cities" do
      other_hotel = Factory(:hotel)
      get :index, :city_id => @city.id
      assigns(:hotels).should_not include(other_hotel)
    end
  end

  describe "#show" do
    let(:hotel){Factory(:hotel)}
    it "assigns the requested hotel" do
      get "show", :id => hotel.id, :city_id => hotel.city.id
      assigns(:hotel).should == hotel
    end
    it "is successful" do
      get "show", :id => hotel.id, :city_id => hotel.city.id

      response.should be_success
    end
  end
end
