require './config/environment'
require 'sinatra/flash'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
    set :session_secret, ENV['SESSION_SECRET']
  end

  # error Sinatra::NotFound do 
  #   erb :error
  # end 

  get "/" do
    erb :welcome
  end

  post "/favoriteposts" do
    post = Post.find_by_id(params[:favoriteposts][:post_id])
    if !post.favorited_by.include?(current_user)
      fav = Favoritepost.create(params[:favoriteposts])
    else
     favortiepost = Favoritepost.where(["user_id = ? and post_id = ?", current_user.id, post.id]).delete_all
    #  binding.pry
    end
    redirect "/posts/#{post.id}"

  end

  helpers do
    def current_user
			@current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def logged_in?
			!!current_user
    end
    
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login"
      end
    end
  end


end
