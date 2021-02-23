class SessionsController < ApplicationController

  get "/login" do
    if logged_in?
      redirect "/users"
    end
    erb :"/sessions/login.html"
  end

  post "/login" do
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else 
      redirect "/login"
    end
  end

  get "/logout" do
    session.clear
    redirect "/"
  end
end

