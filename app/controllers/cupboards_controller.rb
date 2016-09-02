class CupboardsController < ApplicationController
  before_action :require_login

  def index
    @cupboards = Cupboard.all
  end

  def new
    @cupboard = Cupboard.new
  end

  def show
    if @cupboard = Cupboard.find(params[:id])
    else
      redirect_to new_cupboard_path
    end
  end

  def create
    @user = User.find(params[:user_id])
    @cupboard = @user.cupboards.new(cupboard_params)
    if @cupboard.save
      redirect_to edit_user_cupboard_path(@user, @cupboard)
    else
      render :new
    end
  end


  def edit
    @cupboard = Cupboard.find(params[:id])
  end

  def update
    @cupboard = Cupboard.find(params[:id])
    if @cupboard.update_attributes(cupboard_params)
      flash[:notice] = "CUPBOARD WAS SUCCESSFULLY UPDATED!"
      redirect_to action: "accents"
    else
      flash[:alert] = "CUPBOARD NOT SUCCESSFULLY UPDATED"
      render :edit
    end
  end

  def accents
    @cupboard = Cupboard.find(params[:id])
  
    if @cupboard.update_attributes(cupboard_params)
      flash[:notice] = "CUPBOARD WAS SUCCESSFULLY UPDATED!"
      redirect_to action: "show"
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
    # I used .fetch because .permit wasnt working. workaround found at http://stackoverflow.com/questions/24944871/actioncontrollerparametermissing-param-is-missing-or-the-value-is-empty-film
    params.fetch(:cupboard, {}).permit(:style, :season, :neutral1, :neutral2, :accent1, :accent2)
  end
end
