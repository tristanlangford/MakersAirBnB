require 'pg'
def setup_test_database

    connection = PG.connect :dbname => 'makers_bnb_test'

    connection.exec("TRUNCATE properties CASCADE;")

    connection.exec("TRUNCATE users CASCADE;")

    connection.exec("TRUNCATE bookings CASCADE;")

end
