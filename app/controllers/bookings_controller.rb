class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking)
    @pending_bookings_owner = []
    @decided_bookings_owner = []
    @bookings_rider = []
    Booking.all.each do |b|
      horse = b.horse
      if b.user == current_user
        @bookings_rider << b
      elsif b.horse.user == current_user && b.status == true
        @decided_bookings_owner << b
      elsif b.horse.user == current_user && b.status == false
        @pending_bookings_owner << b
      end
    end
  end

  def show
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @horse = Horse.find(params[:horse_id])
    authorize @booking
    @booking.horse = @horse
    @booking.user_id = current_user.id
    @booking.status = false
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'horses/show'
    end
  end

  def update
    authorize @booking
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  def destroy
    @horse = @booking.horse
    authorize @booking
    @booking.destroy
    redirect_to horse_path(@horse)
  end

  private

  def booking_params
    params.require(:booking).permit(:date_from, :date_to, :user_id, :horse_id, :comment, :status)
  end

  def find_booking
  @booking = Booking.find(params[:id])
  end
end
