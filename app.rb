require 'sinatra/base'

class Makers_bnb < Sinatra::Base

  get ('/') do
    erb :index
  end

  get ('/view_properties') do
    erb :properties
  end


  run! if app_file == $0
end
