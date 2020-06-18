require 'available_dates'

describe Available_dates do
  subject  {Available_dates.new('2020-01-01', '2020-01-10', '1')}

  it('Should initialize with start/end date and prop_id') do
    expect(subject.start_date).to eq('2020-01-01')
    expect(subject.end_date).to eq('2020-01-10')
    expect(subject.prop_id).to eq('1')
  end

  describe('List_date') do
    it('Should return an instance of Available_dates with all info') do

      Database_connection.query(("INSERT INTO properties VALUES (1, 'house 1', 'top house' ,'100', 1);"))

      Database_connection.query(("INSERT INTO available_dates VALUES (1, '2020-01-01', '2020-01-10' , 1 );"))

      expect(Available_dates.list_date(1).first.start_date).to eq('2020-01-01')
      expect(Available_dates.list_date(1).first.end_date).to eq('2020-01-10')
      expect(Available_dates.list_date(1).first.prop_id).to eq('1')
    end 
  end

  describe('List_date') do
    it('Should return an instance of Available_dates with all info') do

      Database_connection.query(("INSERT INTO properties VALUES (1, 'house 1', 'top house' ,'100', 1);"))

      Available_dates.add_dates('2020-01-01', '2020-01-10' , 1)

      expect(Available_dates.list_date(1).first.start_date).to eq('2020-01-01')
      expect(Available_dates.list_date(1).first.end_date).to eq('2020-01-10')
      expect(Available_dates.list_date(1).first.prop_id).to eq('1')
    end 
  end
end