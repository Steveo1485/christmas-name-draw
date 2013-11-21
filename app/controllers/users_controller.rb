class UsersController < ApplicationController

  def index
  end

  def new
  end

  def create
    user = User.new(params[:user])
    if user.save
      redirect_to users_path
    else
      redirect_to users_path
    end
  end

end

