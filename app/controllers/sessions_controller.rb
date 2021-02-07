class SessionsController < ApplicationController

  # GET: /sessions
  get "/login" do
    erb :"/sessions/login.html"
  end

  # POST: /sessions
  post "/login" do
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else 
      redirect "/login"
    end
  end
    
  # GET: /sessions/new
  get "/logout" do
    session.clear
    redirect "/"
  end
end

