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
      flash[:success] = "SUCCESS!"
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      flash[:error] = user.errors.full_messages.to_sentence
      redirect "/signup"
    end
  end

  # GET: /users/5
  get "/users/:id" do
    @user = current_user
    erb :"/users/show.html"
  end

  get "/users/:id/favorites" do
    @favorites = current_user.favorites
    erb :"/users/favorites.html"
  end

  # # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    delete_user = User.find_by_id(params[:id])
    if delete_user.user != current_user
      redirect "/users"
    end
    delete_comment.delete
    redirect "/"
  end
end
