class SessionsController < ApplicationController
  # before_action :not_logged_in?, only: [:new, :create]
  before_action :logged_in?, only: [:destroy]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(user_params[:email], user_params[:password])
    if user.nil?
      flash.now[:errors] = ["Incorrect username and/or password"]
      render :new
    else
      log_in!(user)
      redirect_to user_url(user)
    end
  end

  def destroy
    log_out!
    render :new
  end



  private

  def user_params
    params.require(:user).permit(:email, :password)
  end


end
