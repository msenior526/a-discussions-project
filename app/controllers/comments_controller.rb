class CommentsController < ApplicationController

  post "/comments" do
    redirect_if_not_logged_in
    post = Post.find_by_id(params[:comment][:post_id])
    comment = post.comments.build(content: params[:comment][:content], user_id: session[:user_id])
    if comment.save
      flash[:success] = "Successfully created!"
    redirect "/posts/#{post.id}"
    else
      flash[:error] = comment.errors.full_messages.to_sentence
      redirect "/posts/#{post.id}"
    end
  end

  # GET: /comments/5
  get "/comments/:id" do
    erb :"/comments/show.html"
  end

  # # GET: /comments/5/edit
  # get "/comments/:id/edit" do
  #   erb :"/comments/edit.html"
  # end

  # # PATCH: /comments/5
  # patch "/comments/:id" do
  #   redirect "/comments/:id"
  # end

  delete "/comments/:id/delete" do
    delete_comment = Comment.find_by_id(params[:id])
    if delete_comment.user != current_user
      redirect "/posts"
    end
    delete_comment.delete
    redirect "/posts"
  end
end
