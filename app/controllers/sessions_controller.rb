class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # create a session here
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:error] = 'Bad email/password combination. Please try again.'
      render 'new'
    end

  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to site_home_path
  end

end
