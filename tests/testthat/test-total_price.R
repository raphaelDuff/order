test_that("total_price returns a coherent value for EUR", {
  product <- c("smartwatch", "laptop", "monitor", "headphones", "printer")
  price_EUR <- c(217, 517, 279, 173, 110)
  price_USD <- c(249, 591, 319, 198, 125)
  order <- data.frame(product, price_EUR, price_USD)
  expected_EUR <- total_price(data = order, currency = "EUR")
  expect_equal(expected_EUR, 1036.8)
})

test_that("total_price returns a coherent value for USD", {
  product <- c("smartwatch", "laptop", "monitor", "headphones", "printer")
  price_EUR <- c(217, 517, 279, 173, 110)
  price_USD <- c(249, 591, 319, 198, 125)
  order <- data.frame(product, price_EUR, price_USD)
  expected_USD <- total_price(data = order, currency = "USD")
  expect_equal(expected_USD, 1111.5)
})

test_that("total_price test if the currency paramter is a expected value", {
  product <- c("smartwatch", "laptop", "monitor", "headphones", "printer")
  price_EUR <- c(217, 517, 279, 173, 110)
  price_USD <- c(249, 591, 319, 198, 125)
  order <- data.frame(product, price_EUR, price_USD)
  expect_error(total_price(data = order, currency = "BRL"))
})
