class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by( email: params[:session][:email].downcase, password_digest: params[:session][:password] )
    if user
      log_in user
      session[:login] = "logged_in"
      redirect_to '/tasks/logged_in'
    else
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    session.delete(:login)
    redirect_to root_url
  end
end
