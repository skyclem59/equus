class HorsesController < ApplicationController
  before_action :set_horse, only: [:show, :edit, :update, :destroy]

  def index
    @horses = Horse.where.not(latitude: nil, longitude: nil)
    @markers = @horses.map do |horse|
      {
        lat: horse.latitude,
        lng: horse.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
    if params[:query].present?
      @horses = policy_scope(Horse)
    else
      @horses = policy_scope(Horse)
    end
  end

  def show
    @booking = Booking.new
    @markers = [{
            lat: @horse.latitude,
            lng: @horse.longitude#,
            # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
          }]
  end

  def create
    @horse = current_user.horses.new(horse_params)
    authorize @horse
    if @horse.save
      redirect_to horse_path(@horse)
    else
      render :new
    end
  end

  def new
    @horse = Horse.new
    authorize @horse
  end

  def edit
  end

  def update
    authorize @horse
    @horse.update(horse_params)
    redirect_to horses_path
  end

  def destroy
    authorize @horse
    @horse.destroy
    redirect_to horses_path
  end

  private

  def set_horse
    @horse = Horse.find(params[:id])
    authorize @horse
  end

  def horse_params
    params.require(:horse).permit(:name, :coat, :age, :gender, :breed, :localisation, :price, :category, :description, :size, :photo, :photo_cache)
  end
end
