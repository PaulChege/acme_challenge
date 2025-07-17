# Acme Basket Challenge

This challenge implements a shopping basket system with product offers and delivery charges.

## Assumptions

- The code is designed to support future offers. New offer types can be added by creating subclasses of `BaseOffer` in the `offers/` directory, and they will be automatically applied to the basket.

## File Structure

- `basket.rb` - Main basket logic
- `product.rb` - Product class
- `offers/` - Offer classes
- `product_details.json` - Product data
- `test.rb` - Test runner (see below) 

## How to Test

1. Ensure you have Ruby installed.
2. Run the test file:

   ```bash
   ruby test.rb
   ```

This will execute a set of predefined basket scenarios and print PASS/FAIL for each, based on the expected totals. Feel free to try other scenarios.
