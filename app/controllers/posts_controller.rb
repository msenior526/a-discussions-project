class PostsController < ApplicationController

  # GET: /posts
  get "/posts" do
    @posts = Post.all 
    erb :"/posts/index.html"
  end

  # GET: /posts/new
  get "/posts/new" do
    erb :"/posts/new.html"
  end

  # POST: /posts
  post "/posts" do
    post = Post.create(params[:post])
    redirect "/posts/#{post.id}"
  end

  # GET: /posts/5
  get "/posts/:id" do
    @post = Post.find_by_id(params[:id])
    erb :"/posts/show.html"
  end

  # GET: /posts/5/edit
  get "/posts/:id/edit" do
    redirect_if_not_logged_in
    @edit_post = Post.find_by_id(params[:id])
    erb :"/posts/edit.html"
  end

  # PATCH: /posts/5
  patch "/posts/:id" do
    @edit_post = Post.find_by_id(params[:id])
    @edit_post.update(params[:post])
    @edit_post.save
    redirect "/posts/#{@edit_post.id}"
  end

  # DELETE: /posts/5/delete
  delete "/posts/:id/delete" do
    @delete_post = Post.find_by_id(params[:id])
    @delete_post.delete
    redirect "/posts"
  end
end
