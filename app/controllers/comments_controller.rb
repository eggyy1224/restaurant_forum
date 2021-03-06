class CommentsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])

    @comment = @restaurant.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    flash[:notice] = "成功新增留言"
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
      
    @comment = @restaurant.comments.find_by(id: params[:id])
    if current_user.admin?
      @comment.destroy
      flash[:notice] = "comment deleted!"
      redirect_to restaurant_path(@restaurant)
    else
      flash[:alert] = "you are not authaurized!"
      redirect_to restaurant_path(@restaurant)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
