class UsersController < ApplicationController

  def index
  end

  def new
    @new_user = User.new
    @sign_in_user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.save
      redirect_to user_lists_path(user.id)
    else
      redirect_to users_path
    end
  end

  def sign_in
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_lists_path(user.id)
    else
      redirect_to users_path
    end
  end
end

