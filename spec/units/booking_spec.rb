require 'booking'

describe Booking do

    subject { Booking.new('2020-01-01', '2020-01-10', '1', 'nice place!', '2', 'n', '1') }

    it 'should have a start_date' do
        expect(subject.start_date).to eq('2020-01-01')
    end

    it 'should have an end_date' do
        expect(subject.end_date).to eq('2020-01-10')
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

            Database_connection.query(("INSERT INTO properties VALUES (1, 'house 1', 'top house' ,'100' );"))

            Database_connection.query("INSERT INTO bookings(booking_id, start_date, end_date, comments, booker_id, property_id, confirmation)
            VALUES ('1', '2020-01-01', '2020-01-10', 'nice place!', '1', '1', 'n')")

            property = Booking.list_bookings
            expect(property.first.start_date).to eq('2020-01-01')
            expect(property.first.end_date).to eq('2020-01-10')
            expect(property.first.comment).to eq('nice place!')
            expect(property.first.prop_id).to eq('1')
            expect(property.first.booker_id).to eq('1')
            expect(property.first.confirmation).to eq('n')
            expect(property.first.booking_id).to eq('1')
        end
    end

    describe 'add_booking' do
      it 'should a booking to the database' do

        Database_connection.query(("INSERT INTO properties VALUES (1, 'house 1', 'top house' ,'100' );"))

        Booking.add_booking('2020-01-01', '2020-01-10', 'nice place!', '1', '1')

        property = Booking.list_bookings
        expect(property.first.start_date).to eq('2020-01-01')
        expect(property.first.end_date).to eq('2020-01-10')
        expect(property.first.comment).to eq('nice place!')
        expect(property.first.prop_id).to eq('1')
        expect(property.first.booker_id).to eq('1')
        expect(property.first.confirmation).to eq('n')
      end
    end
end
