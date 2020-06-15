require 'pg'
def setup_test_database

    connection = PG.connect :dbname => 'airbnb_test'

    connection.exec("TRUNCATE properties;")

end
