class Product
  attr_reader :name, :code, :price

  def initialize(name:, code:, price:)
    @code = code
    @name = name
    @price = price
  end
end