require "sinatra"
require "sinatra/activerecord"
require "./models"
# this is needed for sinatra flash messaging
# require "bundle/setup"
require "sinatra/flash"
require 'pp'


set :database, "sqlite3:new.sqlite3"

set :sessions, true

get "/" do
  erb :home
end

# Instance variable post, shows recent posts
get "/feed" do
  # this grabs all the user's posts
  @posts = Post.all
  # this shows the recent post
  @latest_post = Post.all.last(10)
  erb :feed
end

post '/feed' do
  @post = Post.new({:content => params[:post]})
  @post.save
  session[:post_id] = @post.id
  # @post =  Post.create(params[:post])
  # session[:user_id] = @post.id
  # session[:user_id] = @user.id
  # flash[:notice] = "You created a new post!"
  redirect '/feed'
end

# this is what creates the posts
post '/create-post' do
  @post = Post.new({:content => params[:post]})
  @post.save
  session[:post_id] = @post.id
  Post.create(
  title: params[:title],
  content: params[:content],
  user_id: session[:user_id]
  )
  flash[:notice] = "You created a new post!"
  redirect '/feed'
end

get "/users" do
  @users = User.all
  pp @users
  erb :index
end

get "/users/:id" do
  @user = User.find(params[:id])
  erb :users
end

get "/myaccount" do
  @user = User.find(session[:user_id])
  pp @user
  erb :myaccount
end

post "/myaccount" do
  @user = User.find(session[:user_id])
  pp @user
  erb :myaccount
end

get '/user-profile' do
  @user_profile = Profile.find_by(user_id:session[:user_id])
  erb :myaccount
end

get "/profile/:id" do
  @user_profile = Profile.find(params[:id])
  erb :user_profile
end

get "/signin" do
  erb :signin
end

get '/join' do
  erb :join
end

# this creates new user
post '/join' do
  @user = User.create(
  fname: params[:fname],
  lname: params[:lname],
  username: params[:username],
  password: params[:password],
  )
  session[:user_id] = @user.id
  flash[:notice] = "You created a new account!"
  redirect '/'
end

# this is what lets the user sign in
post '/signin' do
  @user = User.where(username: params[:username]).first
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    flash[:notice] = "You have signed in successfully."
    redirect '/signin'
  else
    flash[:notice] = "Your username and password do not match."
  end
   redirect "/signin"
 end

# goes to home page on sign out
get "/signout" do
  session[:user_id] = nil
  redirect "/"
end

post "/signout" do
  session[:user_id] = nil
  redirect "/"
end


get "/delete_account" do
  User.find(session[:user_id]).destroy
    session[:user_id] = nil
  redirect "/"
end

post "/delete_account" do
  User.find(session[:user_id]).destroy
    session[:user_id] = nil
  redirect "/"
end

get "/edit" do
  erb :edit
end

  # def destroy

    # @user = User.find(params[:id])
    # if @user.destroy
    #   flash[:notice] = "Profile deleted."
    #   session[:user_id] = nil
    # else
    #   flash[:alert] = "Could not delete your profile."
    # end
    #   redirect_to "/"
# end

# get "/user_create" do
#     User.create(username:"andrew", password:"jackson")
# end
