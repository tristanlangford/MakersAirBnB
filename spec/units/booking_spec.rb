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

end