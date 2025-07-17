class RedsHalfPriceOffer < BaseOffer
  def apply(basket)
    reds = basket.items.select { |item| item.code == 'R01' }

    # For every pair of 'R01', apply half price discount to the second item
    reds.each_slice(2) do |pair|
      pair[1].discount = pair[1].price / 2  if pair.size == 2
    end
  end
end