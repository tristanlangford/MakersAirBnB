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

  post ('/signup') do 
    Model_Maker_bnb.add_user(params[:email], params[:first_name], params[:last_name], params[:password])
  end


  run! if app_file == $0
end
