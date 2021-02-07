class UsersController < ApplicationController

  get "/users" do
    redirect_if_not_logged_in
    redirect "users/:id"
  end

  # GET: /users/new, SIGNUP PAGE
  get "/signup" do
    if logged_in?
      redirect "/users"
    end
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
