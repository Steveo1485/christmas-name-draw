class UsersController < ApplicationController

  def new
    redirect_to user_lists_path(session[:user_id]) if session[:user_id]
    @new_user = User.new
    @sign_in_user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect_to user_lists_path(user.id)
    else
      flash[:sign_up_error] = user.errors.full_messages.join(', ')
      redirect_to root_path
    end
  end

  def sign_in
    user = User.find_by_email(params[:user][:email])
    user_by_name = User.find_by_first_name(params[:user][:first_name])
    if user && user == user_by_name && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_lists_path(user.id)
    else
      flash[:sign_in_error] = "Please try again."
      redirect_to root_path
    end
  end

  def sign_out
    session[:user_id] = nil
    redirect_to root_path
  end
end

