require 'spec_helper'

describe TripsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      trip = Factory(:trip)
      get 'show', :id => trip.id
      response.should be_success
    end
  end

end
