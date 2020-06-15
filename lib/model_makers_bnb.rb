require 'pg'
require_relative 'properties'

class Model_Makers_bnb 

    def self.get_properties 

        properties = Database_connection.query("SELECT * FROM properties")

        properties.map { |row| Properties.new( row["name"], row["price"], row["description"], row["prop_id"])}
    end

end