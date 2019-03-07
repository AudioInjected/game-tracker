class ApplicationController < Sinatra::Base

  configure do
  	enable :sessions
  	set :session_secret, "secret"
  end

  set :views, Proc.new { File.join(root, "templates") } # looks at templates in the views directory
  
end