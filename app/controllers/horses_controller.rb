class HorsesController < ApplicationController
  before_action :set_horse, only: [:show, :edit, :update, :destroy]

  def index
    @horses = Horse.all
  end

  def random
  @random = Horse.limit(3).order("RANDOM()")
  end

  def show
  end

  def create
    @horse = Horse.new(horse_params)
    @horse.user = current_user
    if @horse.save
      redirect_to horse_path(@horse)
    else
      render :new
    end
  end

  def new
    @horse = Horse.new
  end

  def edit
  end

  def update
    @horse.update(horse_params)
    redirect_to horses_path
  end

  def destroy
    @horse.destroy
    redirect_to horses_path
  end

  private

  def set_horse
    @horse = Horse.find(params[:id])
  end

  def horse_params
    params.require(:horse).permit(:name, :coat, :age, :gender, :breed, :localisation, :price, :category, :description, :size, :photo, :photo_cache)
  end
end
