class UserController < ApplicationController
  def index
    @user = User.all
  end

  def new
      @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), alert: 'Signed up successfully'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "USER WAS SUCCESSFULLY UPDATED!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "USER NOT SUCCESSFULLY UPDATED"
      render :edit
    end
  end


  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
