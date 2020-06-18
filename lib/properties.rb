class Property

    attr_reader :name, :price, :description, :id, :user_id

  def initialize(name, price, description, id, user_id)
    @name = name
    @price = price
    @description = description
    @id = id
    @user_id = user_id
  end

end