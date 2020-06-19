require_relative './lib/data_base_connection'

if ENV["RACK_ENV"] == "test"
  Database_connection.set_database('makers_bnb_test')
else
  Database_connection.set_database('makers_bnb')
end
