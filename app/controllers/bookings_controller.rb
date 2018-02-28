class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @horse = Horse.find(params[:horse_id])
    @booking.horse = @horse
    if @booking.horse.save
      redirect_to booking_path(@booking.horse)
    else
      render 'horses/show'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @horse = @booking.horse
    @booking.destroy
    redirect_to horse_path(@horse)
  end

  private

  def booking_params
    params.require(:booking).permit(:date_from, :date_to, :user_id, :horse_id)
  end
end
