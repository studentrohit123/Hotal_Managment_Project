class HotelsController < ApplicationController
  
  before_action :get_hotel , only: [:edit, :update, :destroy]

  before_action :set_hotel, only: [:index, :edit]

  def index 
  end

  def new 
    @hotel = Hotel.new
  end

  def create 
    @hotel = Hotel.new(hotel_params)
    if @hotel.save 
      flash[:notice] = 'Hotel information was successfully create'
      redirect_to hotels_path(@hotel)
    else
      render :new
    end
  end

  def edit 
  end

  def update
    if @hotel.update(hotel_params)
      flash[:notice] = 'Hotel information was succesfully updadte. '
      redirect_to hotels_path(@hotel)
    else
      render :edit
    end
  end

  def destroy
    if @hotel.destroy
      flash[:notice] = 'Hotel was successfully deleted.'
      redirect_to hotels_path(@hotel)
    else
      flash[:alert] = "Hotel was not deleted."
    end
  end
  
  private

  def set_hotel
    @hotels = Hotel.all
  end

  def get_hotel
    @hotel = Hotel.find(params[:id])
  end

  def hotel_params
    params.require(:hotel).permit(:name, :address, :contact_number, :description, :rating, :image)
  end
end