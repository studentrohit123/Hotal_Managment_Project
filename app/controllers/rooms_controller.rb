class RoomsController < ApplicationController
  
  before_action :get_room, only: [:edit, :update, :destroy]

  before_action :set_hotel, only: [:new, :edit]

  before_action :set_room, only: [:index, :edit]
  
  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "Room information was successfully create"
      redirect_to rooms_path(@room)
    else
      render :new
    end
  end

  def show
    @hotels = Hotel.find(params[:id])
    @rooms = @hotels.rooms
  end

  def edit
  end

  def update
    if @room.update(room_params)
      flash[:notice] = 'Room information was succesfully updadte. '
      redirect_to rooms_path(@room)
    else
      render :edit 
    end
  end

  def destroy
    if @room.destroy
      flash[:notice] = 'Room was successfully deleted.'
      redirect_to rooms_path(@room)
    else
      flash[:notice] = 'Room was not deleted.'
    end
  end

  private

  def set_room
    @rooms = Room.all
  end

  def get_room
    @room = Room.find(params[:id])
  end

  def set_hotel
    @hotels = Hotel.all
  end

  def room_params
    params.require(:room).permit(:room_number, :room_type, :price, :capacity, :hotel_id, :image)
  end
end
