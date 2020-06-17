require 'booking' 

describe Booking do 

    subject { Booking.new('01/01/20', '10/01/20', '1', 'nice place!', '2', 'n') }

    it 'should have a start_date' do 
        expect(subject.start_date).to eq('01/01/20')
    end

    it 'should have an end_date' do 
        expect(subject.end_date).to eq('10/01/20')
    end

    it 'should have a prop_id' do 
        expect(subject.prop_id).to eq('1')
    end

    it 'should have a comment' do 
        expect(subject.comment).to eq('nice place!')
    end

    it 'should have a booker_id' do 
        expect(subject.booker_id).to eq('2')
    end

    it 'should have a confirmation' do 
        expect(subject.confirmation).to eq('n')
    end

    describe 'List_bookings' do
        it ' should return a Booking instance with all booking info' do
            Database_connection.query(("INSERT INTO users (user_id, email, first_name, last_name,
                password) VALUES (1, 'some_email@hotmail.com', 'Tristan', 'Langford', 'password');"))

            Database_connection.query(("INSERT INTO properties VALUES (1, 'house 1', 'top house' ,'100' );"))

            Database_connection.query("INSERT INTO bookings(booking_id, start_date, end_date, comments, booker_id, property_id, confirmation)
            VALUES ('1', '01/01/20', '10/01/20', 'nice place!', '1', '1', 'n')")
            
            property = Booking.List_bookings
            expect(property.first.start_date).to eq('01/01/20')
            expect(property.first.end_date).to eq('10/01/20')
            expect(property.first.comment).to eq('nice place!')
            expect(property.first.prop_id).to eq('1')
            expect(property.first.booker_id).to eq('1')
            expect(property.first.confirmation).to eq('n')
        end
    end

end