class HorsesController < ApplicationController
  before_action :set_horse, only: [:show, :edit, :update, :destroy]

  def index

    if params[:query].present?
      @horses = policy_scope(Horse)
    else
      @horses = policy_scope(Horse)
    end
  end

  def show
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
