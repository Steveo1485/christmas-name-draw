class ListsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @new_list = List.new
  end

  def create
    user = User.find(params[:user_id])
    list = List.new(params[:list])
    list.user_id = user.id
    if list.save
      redirect_to user_list_path(list.user_id, list.id)
    else
      redirect_to new_user_list_path
    end
  end

  def show
    @list = List.find(params[:id])
  end

end