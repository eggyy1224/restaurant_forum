class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]


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

  

  def update
    
    
    if @restaurant.update_attributes(restaurant_parameters)
      redirect_to admin_restaurant_path(@restaurant)
      flash[:notice] = "編輯成功！"
    else
      flash.now[:alert] = "編輯失敗"#flash要跳頁之後才有用
      render :edit
    end
  end

  def destroy
    @restaurant.destroy 
    redirect_to admin_restaurants_path
    flash[:alert] = "成功刪除"
  end

  private
    def restaurant_parameters
      params.require(:restaurant).permit(:name, :tel, :address, :opening_hours, :description, :image)
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

  
end
