require 'sinatra/base'
require 'grit'
require 'fileutils'

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)

  # ROUTES #

  get "/" do
  	erb :index
  end

  get "/repo" do
      repo = Grit::Git.new('/tmp/repo')
      @process = repo.clone({:process_info => true, :progress => true, :timeout => false}, "#{params[:repo_url]}", "tmp/test")
      @todos = %x{grep -RIn TODO #{File.dirname(__FILE__)}/tmp/test}
      FileUtils.rm_rf("#{File.dirname(__FILE__)}/tmp/test")
      erb :index
  end

  # HELPERS #

  helpers do
  
  end
end