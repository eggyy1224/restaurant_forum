class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = '新增類別成功！'
      redirect_to admin_categories_url
    else
      @categories = Category.all
      flash[:alert] = '新增失敗！'
      render 'index'
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
