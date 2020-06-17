class User

    attr_reader :user_id, :first_name, :last_name, :email, :password

    def initialize(user_id, first_name, last_name, email)
        @user_id = user_id
        @first_name = first_name
        @last_name = last_name
        @email = email
    end

end