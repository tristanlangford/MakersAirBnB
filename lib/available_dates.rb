require 'date'
class Available_dates

  attr_reader :start_date, :end_date, :prop_id

  def initialize(start_date, end_date, prop_id)
    @start_date = format_date(start_date)
    @end_date = format_date(end_date)
    @prop_id = prop_id
  end

  def self.list_date(prop_id)
    result = Database_connection.query(("SELECT * FROM available_dates WHERE property_id = '#{prop_id}'"))
    dates = result.map { |date| Available_dates.new(date['start_date'], date['end_date'], date['property_id'])}
    dates[0]
  end

  def self.add_dates(start_date, end_date, property_id)
    Database_connection.query("INSERT INTO available_dates (start_date, end_date, property_id) VALUES ('#{start_date}', '#{end_date}', '#{property_id}')")
  end

  def self.edit_dates(start_date, end_date, property_id)
    Database_connection.query("UPDATE available_dates SET start_date = '#{start_date}', end_date = '#{end_date}' WHERE property_id = '#{property_id}'")
  end

  private 

  def format_date(date)
    Date.parse(date).strftime("%d/%m/%Y")
  end

end