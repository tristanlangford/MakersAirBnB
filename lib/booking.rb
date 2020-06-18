require 'date'

class Booking

  DATE_FORMAT = '%Y-%m-%d'

    attr_reader :start_date, :end_date, :prop_id, :comment, :booker_id, :confirmation, :booking_id

    def initialize(start_date, end_date, prop_id, comment, booker_id, confirmation, booking_id)
        @start_date = start_date
        @end_date = end_date
        @prop_id = prop_id
        @comment = comment
        @booker_id = booker_id
        @confirmation = confirmation
        @booking_id = booking_id
    end

    def self.list_bookings
        bookings = Database_connection.query("SELECT * FROM bookings")
        bookings.map { |booking| Booking.new( booking['start_date'], booking['end_date'], booking['property_id'], booking['comments'],
        booking['booker_id'], booking['confirmation'], booking['booking_id'])}
    end

    def self.add_booking(start_date, end_date, comments, booker_id, property_id)
      Database_connection.query("INSERT INTO bookings(start_date, end_date, comments, booker_id, property_id)
      VALUES ('#{start_date}', '#{end_date}', '#{comments}', '#{booker_id}', '#{property_id}')")
    end

end
