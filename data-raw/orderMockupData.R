#' Script used to create data to test the function total_price
#' Output: Three datasets are created:
#' 1) a regular dataset
#' 2) a dataset containing one NA value
#' 3) a dataset missing the column price_EUR

product <- c("smartwatch", "laptop", "monitor", "headphones", "printer")
price_EUR <- c(217, 517, 279, 173, 110)
price_USD <- c(249, 591, 319, 198, 125)
orderData <- data.frame(product, price_EUR, price_USD)
price_EUR <- c(217, 517, 279, 173, NA)
orderNaData <- data.frame(product, price_EUR, price_USD)
orderMissingColumnData <- data.frame(product, price_USD)
usethis::use_data(orderData, overwrite = TRUE)
usethis::use_data(orderNaData, overwrite = TRUE)
usethis::use_data(orderMissingColumnData, overwrite = TRUE)
