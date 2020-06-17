require_relative 'database_connection_setup'
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

  get ('/sign_in') do 
    erb :sign_in
  end

  post ('/sign_in') do 
    sign_in_response = SignupChecks.sign_in_checks(params[:email], params[:password])
    if sign_in_response == :email_does_not_exist
      flash[:email_does_not_exist] = "Email incorrect."
      redirect('/sign_in')
    elsif
      sign_in_response == :passwords_do_not_match
      flash[:passwords_do_not_match] = "Password incorrect."
      redirect('/sign_in')
    end
    session[:user] = Model_Makers_bnb.get_users_for_signin(params[:email])
    redirect('/view_properties')
  end

  get ('/signup') do
    erb :signup
  end

  post ('/signup') do
    signup_response = SignupChecks.signup_checks(params[:email], params[:password], params[:confirm_password])
    if signup_response == :email_exists
      flash[:email_exists] = "An account already exists with this email address."
      redirect('/signup')
    elsif signup_response == :passwords_do_not_match
      flash[:passwords_do_not_match] = "Passwords don't match."
      redirect('/signup')
    elsif signup_response == :email_format_incorrect
      flash[:email_format_incorrect] = "Email address is invalid."
      redirect('/signup')
    end

    Model_Makers_bnb.add_user(params[:email], params[:first_name], params[:last_name], params[:password])
  end


  run! if app_file == $0
end
