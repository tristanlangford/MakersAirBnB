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

    describe('.add_property') do
        it('can add a new property to the database') do
            Model_Makers_bnb.add_property('Test Listing', 50, 'bottom house')
            expect(Model_Makers_bnb.get_properties.last.name).to eq('Test Listing')
            expect(Model_Makers_bnb.get_properties.last.price).to eq('50')
            expect(Model_Makers_bnb.get_properties.last.description).to eq('bottom house')
        end
    end

end