class BookingsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  before_action :get_booking, only: [:show, :destroy]

  def index 
    if current_user
      @bookings = current_user.bookings
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @booking = Booking.new 
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    if params[:status] == 'success'
      @booking.update(payment_status: 'paid')
      flash[:notice] = 'Payment successful!'
    elsif params[:status] == 'cancel'
      flash[:alert] = 'Payment canceled!'
    elsif current_user
      @booking = current_user.bookings
    end
  end

  def destroy
    if @booking.destroy
      flash[:notice] = 'Booking was successfully destroyed.'
      redirect_to bookings_path(@booking)
    else
      flash[:notice] = 'Booking was not destroyed.'
    end
  end
  
  private
  
  def get_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :room_id, :date, :name, :age, :gender, :contact)
  end
end


