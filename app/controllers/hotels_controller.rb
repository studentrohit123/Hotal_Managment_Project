class HotelsController < ApplicationController
  before_action :get_hotel , only: [:edit, :update, :destroy]

  def index 
    @hotels = Hotel.all 
  end

  def new 
    @hotel = Hotel.new
  end

  def create 
    @hotel = Hotel.new(hotel_params)
    if @hotel.save 
      redirect_to hotels_path(@hotel), notice: 'Hotel information was successfully create'
    else
      render :new
    end
  end

  def edit 
    @hotels = Hotel.all
  end

  def update
    if @hotel.update(hotel_params)
      redirect_to hotels_path(@hotel), notice: 'Hotel information eas succesfully updadte. '
    else
      render :edit
    end
  end

  def destroy
    @hotel.destroy
    redirect_to hotels_path(@hotel), notice: 'Hotel was successfully deleted.'
  end

  def get_hotel
    @hotel = Hotel.find(params[:id])
  end

  private
  def hotel_params
    params.require(:hotel).permit(:name, :address, :contact_number, :description, :rating)
  end
end