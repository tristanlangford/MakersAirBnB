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

    def self.list_user_bookings(user_id)
      user_bookings = Database_connection.query("SELECT * FROM bookings
        JOIN properties ON bookings.property_id = properties.prop_id
        WHERE user_id = '#{user_id}'; ")

        user_bookings.map do |booking| { booking_id: booking['booking_id'], start_date: booking['start_date'],
        end_date: booking['end_date'], name: booking['name'], comments: booking['comments'], confirmed: booking['confirmation']} end
    end

    def self.confirm_booking(booking_id)
      Database_connection.query("UPDATE bookings SET confirmation = 'y' WHERE
        booking_id = '#{booking_id}'")

      property_id = Database_connection.query("SELECT property_id FROM bookings WHERE booking_id = '#{booking_id}'")

      property = property_id.map { |row| row['property_id'] }

      delete_available_dates(property.first)
    end

  private

  def self.delete_available_dates(property_id)
    Database_connection.query("DELETE FROM available_dates WHERE property_id = '#{property_id}'")
  end
end
