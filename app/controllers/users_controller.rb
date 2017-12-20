class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @commented_restaurants = @user.restaurants.uniq
  end

  def edit

    @user = User.find(params[:id]) 
    unless current_user == @user
      redirect_to current_user
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params) 
      flash[:notice] = "成功更新個人資料！"
      redirect_to @user
    else
      flash[:danger] = "資料更新失敗！"
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :intro, :avatar)
    end
end
