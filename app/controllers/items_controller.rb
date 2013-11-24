class ItemsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    list = List.find(params[:list_id])
    item = Item.new(params[:item])
    item.list_id = list.id
    if item.save
      redirect_to user_lists_path(user.id, list.id)
    else
      redirect_to user_lists_path(user.id, list.id)
    end
  end

end