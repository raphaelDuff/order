test_that("total_price returns a coherent value for EUR", {
  expected_EUR <- total_price(data = orderData, currency = "EUR")
  expect_equal(expected_EUR, 1036.8)
})

test_that("total_price returns a coherent value for USD", {
  expected_USD <- total_price(data = orderData, currency = "USD")
  expect_equal(expected_USD, 1111.5)
})

test_that("total_price test if the currency paramter is a expected value", {
  expect_error(total_price(data = orderData, currency = "BRL"))
})

test_that("NA value(s) detected in the dataset", {
  expect_error(total_price(data = orderNaData, currency = "BRL"))
})

test_that("Column missing to calculate", {
  expect_error(total_price(data = orderMissingColumnData, currency = "USD"))
})

test_that("total_price returns a double type value", {
  expected <- total_price(data = orderData)
  expect_type(expected, "double")
})
