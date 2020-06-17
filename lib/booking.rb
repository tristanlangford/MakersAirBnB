require 'date'
class Booking


    attr_reader :start_date, :end_date, :prop_id, :comment, :booker_id, :confirmation, :booking_id

    def initialize(start_date, end_date, prop_id, comment, booker_id, confirmation, booking_id)
        @start_date = Date.parse(start_date)
        @end_date = Date.parse(end_date)
        @prop_id = prop_id
        @comment = comment
        @booker_id = booker_id
        @confirmation = confirmation
        @booking_id = booking_id
    end

    def self.list_bookings
        bookings = Database_connection.query("SELECT * FROM bookings")
        bookings.map { |booking| Booking.new( booking['start_date'], booking['end_date'], booking['prop_id'], booking['comment'],
        booking['booker_id'], booking['confirmation'], booking['booking_id'])}

    end

end
