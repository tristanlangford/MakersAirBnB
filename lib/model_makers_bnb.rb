require 'pg'
require_relative 'properties'
require_relative 'data_base_connection'

class Model_Makers_bnb 

    def self.get_properties 

        properties = Database_connection.query("SELECT * FROM properties")

        properties.map { |row| Property.new( row["name"], row["price"], row["description"], row["prop_id"])}
    end

    def self.add_property(name, price, description)
        properties = Database_connection.query("INSERT INTO properties (name, price, description) VALUES ('#{name}', '#{price}', '#{description}')")
    end

end