class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    flash[:success] ="#{favorite.post.user.name}さんの投稿をお気に入り"
    redirect_to root_path
  end

  def destroy
    favorite = current_user.favorites.find_by(post_id: params[:id])
    favorite.destroy
    flash[:danger] ="#{favorite.post.user.name}さんのお気に入りを解除"
    redirect_to root_path
  end
end
