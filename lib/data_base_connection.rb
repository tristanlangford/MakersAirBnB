class Database_connection

    def self.set_database(database)
        @connection = PG.connect :dbname => database
    end

    def self.query(sql_code)
        @connection.exec (sql_code)
    end
end
