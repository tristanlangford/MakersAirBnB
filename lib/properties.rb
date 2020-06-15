class Properties

    attr_reader :name, :price, :description, :id

  def initialize(name, price, description, id)
    @name = name
    @price = price
    @description = description
    @id = id
  end

end