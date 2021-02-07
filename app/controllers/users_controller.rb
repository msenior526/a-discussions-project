class UsersController < ApplicationController

  get "/users" do
    redirect "users/:id"
  end
  
  # GET: /users/new, SIGNUP PAGE
  get "/signup" do
    erb :"/users/signup.html"
  end

  # POST: /users
  post "/signup" do
   user = User.create(params[:user])
    if user.valid?
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      redirect "/signup"
    end
  end

  # GET: /users/5
  get "/users/:id" do
    @user = current_user
    erb :"/users/show.html"
  end

  # # DELETE: /users/5/delete
  # delete "/users/:id/delete" do
  #   redirect "/users"
  # end
end
