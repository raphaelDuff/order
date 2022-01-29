#' Computes the total price of a order after applying a discount
#'
#' The discount depends on the currency (EUR or USD) and the date:
#'
#' On 27th November 2020 the discount is 50%
#' On the other dates the discount is
#' 20% for EUR
#' 25% for USD
#'
#' @param data input order data set
#' @param currency "EUR" or "USD"
#'
#' @return A numeric value of the total price of the order
#' @export
#'
#' @examples
#' total_price(data = order, var = "EUR")
#'
#' @importFrom rlang .data
total_price <- function(data, currency = "EUR"){

  # alert user if currency parameter is not EUR or USD ----
  if (!(currency %in% c("EUR", "USD"))){
    usethis::ui_stop("{currency} is not a valid currency. It must be EUR or USD.")
  }

  discount_date <- "2020-11-27"

  discount <- ifelse(currency == "EUR", 0.2, 0.25)
  discount <- ifelse(Sys.Date() == as.Date(discount_date), 0.5, discount)
  order_currency_column <- data %>% dplyr::select(paste0("price_", currency))
  total <- sum(order_currency_column) * (1 - discount)
  return(total)
}
