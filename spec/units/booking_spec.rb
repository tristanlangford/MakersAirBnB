require 'booking' 

describe Booking do 

    subject { Booking.new('01/01/20', '10/01/20', '1') }

    it 'should have a start_date' do 
        expect(subject.start_date).to eq('01/01/20')
    end

    it 'should have an end_date' do 
        expect(subject.end_date).to eq('10/01/20')
    end

    it 'should have a prop_id' do 
        expect(subject.prop_id).to eq('1')
    end

end