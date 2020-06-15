require 'sinatra/base'

class Makers_bnb < Sinatra::Base

  get ('/') do
    erb :index
  end

  get ('/view_properties') do
    @properties = [ {name: 'home one', price: '35', description: 'cheap and nasty'}, {name: 'home two', price: '200', description: 'not cheap and nasty'}]
    erb :properties
  end


  run! if app_file == $0
end
