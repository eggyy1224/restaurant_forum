class UsersController < ApplicationController

  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @commented_restaurants = @user.restaurants.uniq
    @favorite_restaurants = @user.favorited_restaurants.uniq
    @followings = @user.followings
    @followers = @user.followers
    @all_friends = @user.passive_friends.uniq
  end

  def edit

    @user = User.find(params[:id]) 
    unless current_user == @user
      redirect_to current_user
    end
  end

  def update
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to current_user
      return
    end
    if @user.update_attributes(user_params) 
      flash[:notice] = "成功更新個人資料！"
      redirect_to @user
    else
      flash[:danger] = "資料更新失敗！"
      render :edit
    end
  end

  def friends_list
    @user = User.find(params[:id])
    @all_friends = @user.passive_friends.uniq
  end

  private
    def user_params
      params.require(:user).permit(:name, :intro, :avatar)
    end
end
