require 'model_makers_bnb'
require 'pg'

describe Model_Makers_bnb do

    before do

    Database_connection.query(("INSERT INTO properties VALUES (1, 'house 1', 'top house' ,'100' );"))

    end

    it 'can retrieve the properties from the database and put them in classes' do
       expect(Model_Makers_bnb.get_properties[0].name).to eq 'house 1'
    end

    it 'can retrieve the properties from the database and put them in classes' do
        expect(Model_Makers_bnb.get_properties[0].price).to eq "100"
    end

    it 'can retrieve the properties from the database and put them in classes' do
        expect(Model_Makers_bnb.get_properties[0].description).to eq 'top house'
    end

    describe '#get_user' do

        it 'retrieves a user from the database' do
            Database_connection.query(("INSERT INTO users (email, first_name, last_name, password) VALUES ('some_email@hotmail.com', 'Tristan', 'Langford', 'password');"))
            expect(Model_Makers_bnb.get_users[0].email).to eq 'some_email@hotmail.com'
        end

        it 'adds a user to the database' do
            Model_Makers_bnb.add_user('some_email@hotmail.com', 'Tristan', 'Langford', 'password')
            expect(Model_Makers_bnb.get_users[0].email).to eq 'some_email@hotmail.com'
        end
    end
end
