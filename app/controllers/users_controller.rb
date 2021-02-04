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
  get "/users/new" do
   puts params 
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    redirect "/users"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end

  helpers do
    def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end 
  end
end
