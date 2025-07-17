# Acme Basket Challenge

This challenge implements a shopping basket system with product offers and delivery charges.

## Assumptions

- The code is designed to support future offers. New offer types can be added by creating subclasses of `BaseOffer` in the `offers/` directory, and they will be automatically applied to the basket.

## Class Summaries

- **Basket**: Manages the shopping basket, allows adding products by code, applies available offers, and computes the total price including delivery charges.
- **Product**: Represents an individual product with a name, code, price, and discount.
- **BaseOffer**: Abstract base class for all offer types. Subclasses should implement the `apply` method to modify the basket.
- **RedsHalfPriceOffer**: An offer that applies a half-price discount to every second 'R01' (Red Widget) in the basket.

## Product Data

Product details are stored in `product_details.json`.

## How to Test

1. Ensure you have Ruby installed.
2. Run the test file:

   ```bash
   ruby test.rb
   ```

This will execute a set of predefined basket scenarios and print PASS/FAIL for each, based on the expected totals. Feel free to try other scenarios.

## File Structure

- `basket.rb` - Main basket logic
- `product.rb` - Product class
- `offers/` - Offer classes
- `product_details.json` - Product data
- `test.rb` - Test runner (see above) 