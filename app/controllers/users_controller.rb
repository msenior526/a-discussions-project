class UsersController < ApplicationController

  configure do 
    enable :sessions
    set :session_secret, "super_secret_session_secret"
  end

  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  # GET: /users/new, SIGNUP PAGE
  get "/users/signup" do
    erb :"/users/new.html"
  end

  # POST: /users
  post "/signup" do
    user = User.create(params[:user])
    redirect "/users"
  end

  # # GET: /users/5
  # get "/users/:id" do
  #   erb :"/users/show.html"
  # end

  # # GET: /users/5/edit
  # get "/users/:id/edit" do
  #   erb :"/users/edit.html"
  # end

  # # PATCH: /users/5
  # patch "/users/:id" do
  #   redirect "/users/:id"
  # end

  # # DELETE: /users/5/delete
  # delete "/users/:id/delete" do
  #   redirect "/users"
  # end
end
