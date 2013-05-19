class SessionController < ApplicationController
  def new
  end
  def create
    # @auth = User.where(:first=>params[:name]).first
    # if @auth.present? && @auth.authenticate(params[:password])
    #   session[:user_id] = @auth.id
    #   redirect_to root_path
    # else
    #   session[:user_id] = nil
    #   flash[:notice] = "Incorrect login. Please try again."
    #   render :new
    # end
    # authenticate

    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:notice] = "Signed in with twitter!"
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    authenticate
    redirect_to root_path
  end

end