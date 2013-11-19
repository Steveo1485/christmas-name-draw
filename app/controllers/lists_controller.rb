class ListsController < ApplicationController

  def index
  end

  def new
    @new_list = List.new
  end

  def create
    list = List.new(params[:list])
    if list.save
      redirect_to list_path(list.id)
    else
      redirect_to new_list_path
    end
  end

  def show
    @list = List.find(params[:id])
  end

end