class Booking

    attr_reader :start_date, :end_date, :prop_id, :comment

    def initialize(start_date, end_date, prop_id, comment)
        @start_date = start_date
        @end_date = end_date
        @prop_id = prop_id
        @comment = comment
    end

end