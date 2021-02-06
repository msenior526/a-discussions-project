class SessionsController < ApplicationController

  # GET: /sessions
  get "/login" do
    erb :"/sessions/login.html"
  end

  # GET: /sessions/new
  get "/sessions/new" do
    erb :"/sessions/new.html"
  end

  # POST: /sessions
  post "/login" do
    User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:email])
      redirect "/"
    else 
      redirect "/signup"
    end
  end

