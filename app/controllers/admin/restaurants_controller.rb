class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin


  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end 

  def create
    @restaurant = Restaurant.new(restaurant_parameters)
    if @restaurant.save
      redirect_to admin_restaurants_path
      flash[:notice] = "成功新增！"
    else
      flash.now[:alert] = "新增失敗"#flash要跳頁之後才有用
      render :new
    end

  end

  private
    def restaurant_parameters
      params.require(:restaurant).permit(:name, :tel, :address, :opening_hours, :description)
    end

  
end
