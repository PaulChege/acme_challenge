# base_offer.rb
# Abstract base class for all offer types. Subclasses should implement the apply method.
class BaseOffer
  def apply(basket)
    raise NotImplementedError
  end
end