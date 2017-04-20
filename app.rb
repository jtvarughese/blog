require "sinatra"
require "sinatra/activerecord"
# # require "./models"
#
set :database, "sqlite3:xhosa.sqlite3"

get "/" do
  erb :home
end
#
# get "/feed" do
#   Feed erb
#   erb :feed
# end
#
# get "/users" do
#   users
#   erb :users
# end
#
# get "my-account" do
#   my account
#   erb :myaccount
# end
