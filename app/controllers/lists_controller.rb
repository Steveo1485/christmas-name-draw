class ListsController < IndexController

  def index
    @user = User.find(params[:user_id])
    @list = List.find_by_user_id(@user.id)
    @item = Item.new
  end

  def create
    user = User.find(params[:user_id])
    list = List.new(params[:list])
    list.user_id = user.id
    if list.save
      redirect_to user_lists_path(list.user_id)
    else
      redirect_to new_user_list_path
    end
  end

end