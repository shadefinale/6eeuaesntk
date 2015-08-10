class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:notice] = "You've successfully signed in!"
      redirect_to @user
    else
      binding.pry
      flash.now[:notice] = "Unable to sign in, please try again."
      render :new
    end
  end

  def destroy
    sign_out
    flash[:notice] = "You've been signed out."
    redirect_to new_session_path
  end
end

