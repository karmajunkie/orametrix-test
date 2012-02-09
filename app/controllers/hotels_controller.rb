class HotelsController < ApplicationController
  before_filter :load_hotel, :except => [:index, :new, :create]
  def index
    city = City.find(params[:city_id])
    @hotels = city.hotels
  end

  def new
    @hotel = Hotel.new
  end

  def show
  end

  def create
    @hotel = Hotel.new(params[:hotel])
    if @hotel.save
      flash[:success] = "Congrats! You created a hotel!"
      redirect_to city_hotel_path(@hotel.city, @hotel)
    else
      flash[:error] = "There was a problem saving your hotel."
      render "new"
    end
  end

  protected
  def load_hotel
    @hotel = Hotel.find(params[:id])
  end
end