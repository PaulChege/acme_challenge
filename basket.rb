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
      puts items.inspect
    else
      raise StandardError, "Product code not found"
    end
  end
end


basket = Basket.new
basket.add('G01')