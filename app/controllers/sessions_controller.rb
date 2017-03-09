class SessionsController < ApplicationController


  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.find_by(name: user_params[:name])
    if @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to session_path(@user.id)
    else
      flash[:erro] = "Username/Password Not Matching"
      redirect_to new_session_path
    end
  end



  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
