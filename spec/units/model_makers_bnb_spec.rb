require 'model_makers_bnb'
require 'pg'

describe Model_Makers_bnb do

    before do

    Database_connection.query(("INSERT INTO properties VALUES (1, 'house 1', 'top house' ,'100', '1');"))

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
            expect(Model_Makers_bnb.get_users[0].email).to eq 'some_email@hotmail.com'
        end

        it 'adds a user to the database' do
            expect(Model_Makers_bnb.get_users[0].email).to eq 'some_email@hotmail.com'
        end
    end

    describe '#get_user' do

        it 'retrieves an individual user from the database' do
            email = 'some_email@hotmail.com'
            expect(Model_Makers_bnb.get_users_for_signin(email).user_id).to eq "1"
        end
    end

    describe('.add_property') do
        it('can add a new property to the database') do
            Model_Makers_bnb.add_property('Test Listing', 50, 'bottom house', 1)
            expect(Model_Makers_bnb.get_properties.last.name).to eq('Test Listing')
            expect(Model_Makers_bnb.get_properties.last.price).to eq('50')
            expect(Model_Makers_bnb.get_properties.last.description).to eq('bottom house')
        end
    end

    describe('.delete_property') do
        it('can delete a property from the database') do
            Model_Makers_bnb.add_property('Test Listing', 50, 'bottom house', 1)
            Model_Makers_bnb.delete_property(1)
            expect(Model_Makers_bnb.get_properties.first.name).to_not eq('house 1')
        end
    end

    describe('.edit_property') do
        it('can edit a property') do
            Model_Makers_bnb.edit_property(1, 'new_name', 10, 'new decr')
            expect(Model_Makers_bnb.get_properties.first.name).to eq('new_name')
        end
    end

end

