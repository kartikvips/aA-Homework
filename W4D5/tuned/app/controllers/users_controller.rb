class UsersController < ApplicationController

  before_action :logged_in?, only: [:show, :update, :destroy]
  # before_action :not_logged_in?, only: [:new, :create]

  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to bands_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end

  end

  def show
    render :show
  end

  def update

  end

  def destroy
    
  end

  private

  def user_params
    params.require(:users).permit(:email, :password)
  end
end
