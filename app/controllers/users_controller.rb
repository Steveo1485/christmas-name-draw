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
    sign_in_name = params[:user][:first_name].capitalize
    user = User.find_by_first_name(sign_in_name)
    if user.email == params[:user][:email] && user.authenticate(params[:user][:password])
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

  def update
    user = User.find(params[:id])
    if user.update_attributes(params[:user])
      redirect_to root_path
    else
      flash[:update_error] = user.errors.full_messages.join(', ')
      redirect_to user_path(user.id)
    end
  end

  def show
    @user = User.find(params[:id])
  end
end

