require 'sinatra/base'

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)

  # ROUTES #

  get "/" do
  	erb :index
  end

  # HELPERS #

  helpers do
  
  end
end