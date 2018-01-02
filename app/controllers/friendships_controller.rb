class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "你們是好友了！"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = @friendship.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy

    friendship = current_user.friendships.find_by(friend_id: params[:id])
    friendship.destroy
    flash[:alert] = "成功解除好友"
    redirect_back(fallback_location: root_path)
  end
end
