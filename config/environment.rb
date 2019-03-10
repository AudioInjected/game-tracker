require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db.sqlite"
)

require 'sinatra/base'
require 'rack-flash'


require_all 'app'
