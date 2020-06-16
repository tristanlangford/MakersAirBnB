require 'pg'
require_relative 'properties'

class Model_Makers_bnb 

    def self.get_properties 

        properties = Database_connection.query("SELECT * FROM properties")

        properties.map { |row| Property.new( row["name"], row["price"], row["description"], row["prop_id"])}
    end

    def self.get_users
        users = Database_connection.query("SELECT * FROM users")

        users.map { |user| User.new( user['user_id'], user['first_name'], user["last_name"], user["email"], user["password"]) }
    end

end