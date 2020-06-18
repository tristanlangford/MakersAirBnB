require 'bcrypt'
require 'pg'
require_relative 'properties'
require_relative 'user'
require_relative 'data_base_connection'

class Model_Makers_bnb

  def self.get_properties

      properties = Database_connection.query("SELECT * FROM properties")

      properties.map { |row| Property.new( row["name"], row["price"], row["description"], row["prop_id"], row["user_id"])}
  end

  def self.get_one_property(property_id)

    property_id_integer = property_id.to_i

    properties = Database_connection.query("SELECT * FROM properties WHERE prop_id = #{property_id_integer}")

    property = properties.map { |row| Property.new( row["name"], row["price"], row["description"], row["prop_id"], row["user_id"])}

    property[0]
end

  def self.get_users
      users = Database_connection.query("SELECT * FROM users")
      users.map { |user| User.new( user['user_id'], user['first_name'], user["last_name"], user["email"]) }
  end

  def self.add_user(email, first_name, last_name, password)
    encrypted_password = encrypt_password(password)
    Database_connection.query("INSERT INTO users (email, first_name, last_name, password) VALUES ('#{email}', '#{first_name}', '#{last_name}', '#{encrypted_password}')")
  end

  def self.get_users_for_signin(email)
    sign_in_user = Database_connection.query("SELECT * FROM users WHERE email = '#{email}'")
    user_array = sign_in_user.map { |user| User.new( user['user_id'], user['first_name'], user["last_name"], user["email"]) }
    user_array[0]
  end
  
  def self.add_property(name, price, description, user_id)
    properties = Database_connection.query("INSERT INTO properties (name, price, description, user_id) VALUES ('#{name}', '#{price}', '#{description}', '#{user_id}')")
  end

  def self.delete_property(propery_id)
    Database_connection.query("DELETE FROM properties WHERE prop_id = '#{propery_id}'")
  end

  def self.edit_property(propery_id, name, price, description)
    Database_connection.query("UPDATE properties SET name = '#{name}', price = '#{price}', description = '#{description}'
    WHERE prop_id = '#{propery_id}'")
  end

  private 

  def self.encrypt_password(password)
    BCrypt::Password.create(password)
  end
end

