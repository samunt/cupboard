class CupboardController < ApplicationController
  def index
    @cupboards = Cupboard.all
  end

  def new
    @cupboard = Cupboard.new
  end

  def create
    @cupboard = Cupboard.new(cupboard_params)
    if @cupboard.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @cupboard = Cupboard.find(params[:id])
  end

  def update
    @cupboard = Cupboard.find(params[:id])
    if @cupboard.update_attributes(user_params)
      flash[:notice] = "CUPBOARD WAS SUCCESSFULLY UPDATED!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "CUPBOARD NOT SUCCESSFULLY UPDATED"
      render :edit
    end
  end

  def delete
    @cupboard = Cupboard.find(params[:id])
    @cupboard.destroy
  end

  private
  def cupboard_params
    params.require(:cupboard).permit(:color, :accent, :top, :bottom, :outer)
  end
end
