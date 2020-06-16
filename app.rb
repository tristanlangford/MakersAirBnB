require 'sinatra/base'
require_relative './lib/model_makers_bnb'
require_relative 'database_connection_setup'

class Makers_bnb < Sinatra::Base

  get ('/') do
    erb :index
  end

  get ('/view_properties') do
    @properties = Model_Makers_bnb.get_properties
    erb :properties
  end

  get ('/list_space') do
    erb :list_space

  end

  post ('/list_space/post') do
    Model_Makers_bnb.add_property(params[:name], params[:price], params[:description])
    redirect ('/view_properties')

  end


  run! if app_file == $0
end
