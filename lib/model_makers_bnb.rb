require 'pg'
require_relative 'properties'

class Model_Makers_bnb 

    def get_properties 
        connection = PG.connect :dbname => 'airbnb_test'

        properties = connection.exec("SELECT * FROM properties")

        properties.map { |row| Properties.new( row["name"], row["price"], row["description"], row["prop_id"])}
    end

end