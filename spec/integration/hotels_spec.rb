require 'spec_helper'

describe "hotels" do
  describe "viewing" do
    let!(:city){ Factory(:city)}
    let!(:hotels) { [Factory(:hotel, :city => city), Factory(:hotel, :city => city)] }

    it "lists all the hotels (css)" do
      visit city_hotels_path(city)
      hotels.each do |hotel|
        page.should have_css(".hotel a[href='#{city_hotel_path(hotel.city,hotel)}']",
                             :text => hotel.name)
      end
    end
    it "lists all the hotels (xpath)" do
      pending "i hate xpath"
      visit city_hotels_path(city)
      hotels.each do |hotel|
        page.should have_xpath("//[class='hotel']/a",
                               :text => hotel.name)
      end
    end

  end

  describe "creating" do
    context "when the hotel is valid" do
      let!(:city) { Factory(:city) }
      let(:hotel) { Factory.attributes_for(:hotel, :city => city) }
      it "creates the new hotel" do
        visit new_city_hotel_path(city)
        within("#new_hotel") do
          fill_in "Name", :with => hotel[:name]
          fill_in "Address", :with => hotel[:address]
          fill_in "Description", :with => hotel[:description]
          fill_in "Rate", :with => hotel[:rate]
          select city.name, :from => "City"
          click_on "Save Hotel"
        end

        page.should have_css(".success", :text => "Congrats!")
      end
    end
    context "when the hotel is not valid" do
      let(:city){Factory(:city)}
      let(:bad_hotel_attributes) { Factory.attributes_for(:hotel, :name => nil, :city => city) }
      it "shows the hotel form" do
        page.driver.post city_hotels_path(city), :hotel => bad_hotel_attributes
        page.should have_css("form.hotel")
      end
      it "shows the error message" do
        page.driver.post city_hotels_path(city), :hotel => bad_hotel_attributes
        page.should have_css(".error", :text => "There was a problem saving your hotel.")
      end
    end
  end
end