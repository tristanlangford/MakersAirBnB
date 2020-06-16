require 'sinatra/base'
require_relative './lib/model_makers_bnb'

class Makers_bnb < Sinatra::Base

  get ('/') do
    erb :index
  end

  get ('/view_properties') do
    @properties = Model_Makers_bnb.get_properties
    erb :properties
  end

  get ('/signup') do 
    erb :signup
  end


  run! if app_file == $0
end
