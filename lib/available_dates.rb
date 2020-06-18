class Available_dates

  attr_reader :start_date, :end_date, :prop_id

  def initialize(start_date, end_date, prop_id)
    @start_date = start_date
    @end_date = end_date
    @prop_id = prop_id
  end

  def self.list_date(prop_id)
    result = Database_connection.query(("SELECT * FROM available_dates WHERE property_id = '#{prop_id}'"))
    result.map { |date| Available_dates.new(date['start_date'], date['end_date'], date['property_id'])}
  end

end