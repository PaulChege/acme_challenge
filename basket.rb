require './product'
require 'json'

Dir["./offers/*.rb"].each { |file| require file }

class Basket
  attr_accessor :items, :product_details

  DEFAULT_CURRENCY_SYMBOL = '$'

  def initialize
    # Load product details from a JSON file
    @product_details = JSON.parse(File.read(File.join(__dir__, 'product_details.json')))
    @items = []
  end

  # Adds a product to the basket by code
  def add(code) 
    product = product_details.find { |p| p['code'] == code }
    if !product.nil?
      items << Product.new(name: product['name'], code: code, price: product['price'])
    else
      raise StandardError, "Product code not found"
    end
  end

  # Computes the total price of the basket, applying offers and delivery charges
  def compute_total
    apply_offers

    price_sum = @items.reduce(0) { |sum, item| sum + item.price - item.discount }
    total = (price_sum + delivery_charge(price_sum)).floor(2)

    return DEFAULT_CURRENCY_SYMBOL + total.to_s
  end

  private

  # Applies all available offers to the basket
  def apply_offers
    offer_classes = ObjectSpace.each_object(Class).select do |klass|
      klass.name&.end_with?("Offer") && klass.name != 'BaseOffer'
    end

    offer_classes.each do |klass|
      offer_instance = klass.new
      offer_instance.apply(self)
    end
  end

  # Calculates delivery charge based on the total price before delivery
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