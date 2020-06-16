require 'sinatra/base'
require_relative './lib/model_makers_bnb'
require_relative './lib/signup_checks'
require 'sinatra'
require 'sinatra/flash'

class Makers_bnb < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

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
    signup_response = SignupChecks.signup_checks(params[:email], params[:password], params[:confirm_password])
    if signup_response == :email_exists
      flash[:email_exists] = "An account already exists with this email address."
      redirect('/signup')
    end

    Model_Makers_bnb.add_user(params[:email], params[:first_name], params[:last_name], params[:password])
  end


  run! if app_file == $0
end
