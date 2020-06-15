require 'model_makers_bnb'
require 'pg'

describe Model_Makers_bnb do 

    subject = Model_Makers_bnb.new

    it 'can retrieve the properties from the database and put them in classes' do 
        connection = PG.connect :dbname => 'airbnb_test'

        connection.exec("INSERT INTO properties VALUES (1, 'house 1', 'top house' ,'100' );")

        expect(subject.get_properties[0].name).to eq 'house 1' 
    end

    it 'can retrieve the properties from the database and put them in classes' do 
        connection = PG.connect :dbname => 'airbnb_test'

        connection.exec("INSERT INTO properties VALUES (1, 'house 1', 'top house' ,'100' );")

        expect(subject.get_properties[0].price).to eq "100"
    end

    it 'can retrieve the properties from the database and put them in classes' do 
        connection = PG.connect :dbname => 'airbnb_test'

        connection.exec("INSERT INTO properties VALUES (1, 'house 1', 'top house' ,'100' );")

        expect(subject.get_properties[0].description).to eq 'top house'
    end

end