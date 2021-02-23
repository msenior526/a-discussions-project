class FavoritePostsController < ApplicationController

  post "/favoriteposts" do
    post = Post.find_by_id(params[:favoriteposts][:post_id])
      if !post.favorited_by.include?(current_user)
        fav = Favoritepost.create(params[:favoriteposts])
      else
        favortiepost = Favoritepost.where(["user_id = ? and post_id = ?", current_user.id, post.id]).delete_all
      end
    redirect "/posts/#{post.slug}"
  end

end