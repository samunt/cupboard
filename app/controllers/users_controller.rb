class UsersController < ApplicationController

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
      render :layout => !request.xhr?

    end

    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        # UserMailer.welcome_email(@user).deliver_later
        self.current_user = @user
        redirect_to user_path(@user), alert: 'SIGNED UP!'
      else
        flash[:alert] = "SIGN UP FAILED!"
        render :new
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        redirect_to user_url(@user)
      else
        render :edit
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to root_url
    end

    private
    def user_params
       params.require(:user).permit(:id, :first_name, :last_name, :email, :password, :password_confirmation, :name)
    end
end
