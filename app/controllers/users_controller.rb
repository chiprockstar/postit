class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash['notice'] = "Your are registered."
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
   # @user = where(params[:id] == session[:user_id])
    @user = User.find_by(id: session[:user_id])
  end
  
  def edit
  
  end
  
  def update
    
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
  
end