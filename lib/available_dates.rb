class Available_dates

  attr_reader :start_date, :end_date, :prop_id

  def initialize(start_date, end_date, prop_id)
    @start_date = start_date
    @end_date = end_date
    @prop_id = prop_id
  end

end