class Admin::CategoriesController < Admin::BaseController
  
  before_action :authenticate_admin
  before_action :set_category, only: [:update, :destroy]

  def index
    @categories = Category.all
    if params[:id]
      @category = Category.find(params[:id])
    else
      @category = Category.new
    end
    
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

  def update
    
    if @category.update(category_params)
      flash[:notice] = '編輯類別成功！'
      redirect_to admin_categories_url
    else
      @categories = Category.all
      flash[:alert] = '編輯失敗！'
      render 'index'
    end
  end

  def destroy
    
    @category.destroy
    flash[:alert] = '成功刪除!'
    redirect_to admin_categories_url
  end



  private
    def category_params
      params.require(:category).permit(:name)
    end

    def set_category
      @category = Category.find(params[:id])
    end
end
