class RoomsController < ApplicationController
  
  before_action :get_room, only: [:edit, :update, :destroy]
  
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
    @hotels = Hotel.all
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path(@room), notice: "Room information was successfully create"
    else
      render :new
    end
  end

  def edit
    @rooms = Room.all
    @hotels = Hotel.all
  end

  def update
    if @room.update(room_params)
      redirect_to rooms_path(@room), notice: 'Room information was succesfully updadte. '
    else
      render :edit 
    end
  end

  def destroy
    @room.destroy
    redirect_to rooms_path(@room),  notice: 'Room was successfully deleted.'
  end

  def get_room
    @room = Room.find(params[:id])
  end

  private

  def room_params
    params.require(:room).permit(:room_number, :room_type, :price, :capacity, :hotel_id, :image)
  end
end
