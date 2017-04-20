require "sinatra"
require "sinatra/activerecord"

# # require "./models"
#
set :database, "sqlite3:xhosa.sqlite3"

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
