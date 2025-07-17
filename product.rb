class Product

  attr_reader :name, :code, :price
  attr_accessor :discount

  def initialize(name:, code:, price:, discount: 0)
    @code = code
    @name = name
    @price = price
    @discount = discount
  end
end