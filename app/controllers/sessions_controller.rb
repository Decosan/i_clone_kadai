class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.find_by(email: params[:session][:email])
      user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] ='Logged in!!'
      redirect_to users_path
    else
      flash[:danger] ='Failed..'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:danger] ='Logout!'
    redirect_to new_user_path
  end
end
