class Booking

    attr_reader :start_date, :end_date, :prop_id, :comment, :booker_id, :confirmation

    def initialize(start_date, end_date, prop_id, comment, booker_id, confirmation)
        @start_date = start_date
        @end_date = end_date
        @prop_id = prop_id
        @comment = comment
        @booker_id = booker_id
        @confirmation = confirmation
    end

end