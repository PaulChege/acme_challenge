require './product'
require 'json'

class Basket
  attr_accessor :items, :product_details

  DEFAULT_CURRENCY_SYMBOL = '$'

  def initialize
    @product_details = JSON.parse(File.read(File.join(__dir__, 'product_details.json')))
    @items = []
  end

  def add(code) 
    product = product_details.find { |p| p['code'] == code }
    if !product.nil?
      items << Product.new(name: product['name'], code: code, price: product['price'])
    else
      raise StandardError, "Product code not found"
    end
  end

  def compute_total
    price_sum = @items.reduce(0) { |sum, item| sum + item.price }
    total = price_sum + delivery_charge(price_sum)
    puts DEFAULT_CURRENCY_SYMBOL + total.to_s
  end

  def delivery_charge(total)
    if total < 50
      4.95
    elsif total < 90
      2.95
    else
      0.0
    end
  end
end


basket = Basket.new
basket.add('B01')
basket.add('G01')
basket.compute_total