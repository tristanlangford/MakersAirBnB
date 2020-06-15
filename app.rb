require 'sinatra/base'

class Makers_bnb < Sinatra::Base 

  get ('/') do
    'Makers BnB'
  end


  run! if app_file == $0
end