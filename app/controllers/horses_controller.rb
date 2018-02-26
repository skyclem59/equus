class HorsesController < ApplicationController
  def index
    @horses = Horse.all
  end

  def show
    @horse = Horse.find(params[:id])
  end

  def create
    @horse = Horse.new(horse_params)
    if @horse.save
      redirect_to horse_path(@horse)
    else
      render :new
    end
  end

  def new
    @horse = Horse.new
  end

  def destroy
  end

  private

  def horse_params
    params.require(:horse).permit(:name, :coat, :age, :gender, :breed, :localisation, :price, :category, :description, :size, :photo, :photo_cache)
  end
end
