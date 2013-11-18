class ListsController < ApplicationController

  def create
    list = List.new(params[:list])
    list.save
    redirect_to root_path
  end

end