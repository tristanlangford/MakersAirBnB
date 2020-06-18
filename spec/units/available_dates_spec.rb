require 'available_dates'

describe Available_dates do
  subject  {Available_dates.new('2020-01-01', '2020-01-10', '1')}

  it('Should initialize with start/end date and prop_id') do
    expect(subject.start_date).to eq('2020-01-01')
    expect(subject.end_date).to eq('2020-01-10')
    expect(subject.prop_id).to eq('1')
  end
end