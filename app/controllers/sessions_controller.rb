class SessionsController < ApplicationController
  def new

  end

  def create
    if @user = login(params[:email], params[:password])
     redirect_back_or_to(user_path(@user), alert: 'LOGIN SUCCESSFUL!')
   else
     flash.now[:alert] = 'LOGIN FAILED!'
     render action: 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out!"
    redirect_to root_url
  end
end
