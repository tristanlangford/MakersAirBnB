require 'bcrypt'
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

  def self.add_user(email, first_name, last_name, password)
    encrypted_password = encrypt_password(password)
    Database_connection.query("INSERT INTO users (email, first_name, last_name, password) VALUES ('#{email}', '#{first_name}', '#{last_name}', '#{encrypted_password}')")
  end

  private 

  def self.encrypt_password(password)
    BCrypt::Password.create(password)
  end
end
