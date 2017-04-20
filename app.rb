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

post "/sign-in" do
  # puts params[:username]
  # puts params[:password]

  @users = User.where(name: params[:name]).first

  if @users.password == params[:password]
    session[:user_id] = @users.id

    flash[:notice] = "You have been signed in."

    redirect "/"
  else
    flash[:notice] = "Your username and password do not match."

    redirect "/sign-in"
  end
end

get "/user_create" do
  User.create(name: "Negrodamus")
end


# get "/sign-out" do
#   session[:user_id] = nil
#   redirect "/"
# end
