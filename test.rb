require './basket'

def run_basket_test(codes, expected_total)
  # Initialize basket with products
  basket = Basket.new
  codes.each { |code| basket.add(code) }
  
  # Check result
  result = basket.compute_total
  if result == "$#{expected_total}"
    puts "PASS: #{codes.inspect} => #{result}"
  else
    puts "FAIL: #{codes.inspect} => #{result} (expected $#{expected_total})"
  end
end

# Test cases: [product codes], expected total
TEST_CASES = [
  [%w[B01 G01], 37.85],
  [%w[R01 R01], 54.37],
  [%w[R01 G01], 60.85],
  [%w[B01 B01 R01 R01 R01], 98.27]
]

TEST_CASES.each do |codes, expected|
  run_basket_test(codes, expected)
end 