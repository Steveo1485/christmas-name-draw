class ListsController < ApplicationController

  def index
  end

  def new
    @new_list = List.new
  end

  def create
    list = List.new(params[:list])
    list.save
    redirect_to root_path
  end

  def show
  end

end