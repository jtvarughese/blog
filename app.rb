require "sinatra"
require "sinatra/activerecord"
require "./models"
# this is needed for sinatra flash messaging
# require "bundle/setup"
require "sinatra/flash"


set :database, "sqlite3:xhosa.sqlite3"

set :sessions, true

get "/" do
  erb :home
end

get "/feed" do
  erb :feed
end

get "/users" do
  erb :users
end

get "/myaccount" do
  erb :myaccount
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
  username: params[:user],
  password: params[:password]
  )

  session[:user_id] = @user.id
  flash[:notice] = "You created a new account!"
  redirect '/join'
end

# this is what lets the user sign in
post '/signin' do
  @user = User.where(username: params[:username]).first
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    flash[:notice] = "You have signed in successfully."
    redirect '/'
  else
    flash[:notice] = "Your username and password do not match."
  end
   redirect "/signin"
 end

get "/signout" do
  session[:user_id] = nil
  redirect "/"
end

# get "/user_create" do
#     User.create(username:"andrew", password:"jackson")
# end
