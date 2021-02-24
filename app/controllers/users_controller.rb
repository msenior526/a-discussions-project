class UsersController < ApplicationController

  get "/users" do
    redirect_if_not_logged_in
    redirect "users/:id"
  end

  get "/signup" do
    if logged_in?
      redirect "/users"
    end
    erb :"/users/signup.html"
  end

  post "/signup" do
   user = User.create(params[:user])
    if user.valid?
      flash[:success] = "You have successfully created an account!"
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      flash[:error] = user.errors.full_messages.to_sentence
      redirect "/signup"
    end
  end

  get "/users/:id" do
    @user = current_user
    erb :"/users/show.html"
  end

  get "/users/:id/favorites" do
    @favorites = current_user.favorites
    erb :"/users/favorites.html"
  end

  get "/users/:id/edit" do
    redirect_if_not_logged_in
    @user = User.find_by_id(params[:id])
    erb :"/users/edit.html"
  end

  patch "/users/:id" do
    edit_user = User.find_by_id(params[:id])
    if edit_user != current_user
      redirect "/users"
    else
      redirect "/users/#{edit_user.id}/edit"
    end
  end

  delete "/users/:id" do
    delete_user = User.find_by_id(params[:id])
    if delete_user != current_user
      redirect "/users"
    end
    delete_user.delete
    session.clear
    redirect "/"
  end
end
