require 'bcrypt'
require 'pg'
def setup_test_database

    connection = PG.connect :dbname => 'makers_bnb_test'

    connection.exec("TRUNCATE users CASCADE;")

    password = BCrypt::Password.create('password')

    connection.exec(("INSERT INTO users (email, first_name, last_name,
              password, user_id) VALUES ('some_email@hotmail.com', 'Tristan', 'Langford', '#{password}', '1');"))

    connection.exec(("INSERT INTO users (email, first_name, last_name,
              password, user_id) VALUES ('holiday_maker@hotmail.com', 'Sam', 'Gubbins', '#{password}', '2');"))
end
