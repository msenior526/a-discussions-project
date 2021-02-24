class PostsController < ApplicationController

  get "/posts" do
    @posts = Post.all 
    erb :"/posts/index.html"
  end

  get "/posts/new" do
    redirect_if_not_logged_in
    @user = current_user
    erb :"/posts/new.html"
  end

  post "/posts" do
    user = current_user
    post = Post.create(params[:post])
    post.user = user
    post.save
    redirect "/posts"
  end

  get "/posts/:slug" do
    @post = Post.find_by_slug(params[:slug])
    if @post.nil?
      raise Sinatra::NotFound
    end
    @comments = @post.comments
    erb :"/posts/show.html"
  end

  get "/posts/:slug/edit" do
    redirect_if_not_logged_in
    @edit_post = Post.find_by_slug(params[:slug])
    if @edit_post.user != current_user
      redirect "/posts"
    end
    erb :"/posts/edit.html"
  end

  patch "/posts/:slug" do
    edit_post = Post.find_by_slug(params[:slug])
    if edit_post.update(params[:post])
      flash[:success] = "Successfully edited your post!"
      redirect "/posts/#{edit_post.slug}"
    else 
      flash[:error] = edit_post.errors.full_messages.to_sentence
      redirect "/posts/#{edit_post.slug}/edit"
    end
  end

  delete "/posts/:slug" do
    delete_post = Post.find_by_slug(params[:slug])
    if delete_post.user != current_user
      redirect "/posts"
    end
    delete_post.delete
    redirect "/posts"
  end
end
