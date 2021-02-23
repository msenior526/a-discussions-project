class PostsController < ApplicationController

  # GET: /posts
  get "/posts" do
    @posts = Post.all 
    erb :"/posts/index.html"
  end

  # GET: /posts/new
  get "/posts/new" do
    redirect_if_not_logged_in
    @user = current_user
    erb :"/posts/new.html"
  end

  # POST: /posts
  post "/posts" do
    @user = current_user
    post = Post.create(params[:post])
    post.user = @user
    post.save
    redirect "/posts"
  end

  # GET: /posts/5
  get "/posts/:slug" do
    @post = Post.find_by_slug(params[:slug])
    @comments = @post.comments
    erb :"/posts/show.html"
  end

  # GET: /posts/5/edit
  get "/posts/:slug/edit" do
    redirect_if_not_logged_in
    @edit_post = Post.find_by_slug(params[:slug])
    if @edit_post.user != current_user
      redirect "/posts"
    end
    erb :"/posts/edit.html"
  end

  # PATCH: /posts/5
  patch "/posts/:slug" do
    edit_post = Post.find_by_slug(params[:slug])
    if edit_post.update(params[:post])
      redirect "/posts/#{edit_post.slug}"
    else 
      redirect "/posts/#{edit_post.slug}/edit"
    end
  end

  # DELETE: /posts/5/delete
  delete "/posts/:slug/delete" do
    delete_post = Post.find_by_slug(params[:slug])
    if delete_post.user != current_user
      redirect "/posts"
    end
    delete_post.delete
    redirect "/posts"
  end
end
