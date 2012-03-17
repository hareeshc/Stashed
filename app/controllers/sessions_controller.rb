class SessionsController < ApplicationController
  def new
   # @session = Session.new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to services_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to services_url, :notice => "Logged out!"
  end
end