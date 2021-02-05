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
      redirect "/login"  
  end

  # GET: /sessions/5
  get "/sessions/:id" do
    erb :"/sessions/show.html"
  end

  # GET: /sessions/5/edit
  get "/sessions/:id/edit" do
    erb :"/sessions/edit.html"
  end

  # PATCH: /sessions/5
  patch "/sessions/:id" do
    redirect "/sessions/:id"
  end

  # DELETE: /sessions/5/delete
  delete "/sessions/:id/delete" do
    redirect "/sessions"
  end
end
