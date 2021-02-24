class CommentsController < ApplicationController

  post "/comments" do
    redirect_if_not_logged_in
    post = Post.find_by_id(params[:comment][:post_id])
    comment = post.comments.build(content: params[:comment][:content], user_id: session[:user_id])
    if comment.save
      flash[:success] = "Successfully created!"
    redirect "/posts/#{post.slug}"
    else
      flash[:error] = comment.errors.full_messages.to_sentence
      redirect "/posts/#{post.slug}"
    end
  end

  delete "/comments/:id/delete" do
    delete_comment = Comment.find_by_id(params[:id])
    if delete_comment.user != current_user
      redirect "/posts"
    end
    delete_comment.delete
    redirect "/posts"
  end
end
