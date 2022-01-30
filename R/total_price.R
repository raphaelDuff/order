#' Computes the total price of a order after applying a discount
#'
#' The discount depends on the currency (EUR or USD) and the date.
#'
#' On 27th November 2020 the discount is 50%.
#' On the other dates the discount is 20% for EUR or 25% for USD.
#'
#' @param data input order dataset
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
    usethis::ui_stop("{currency} is not a valid currency. It must be EUR or
                     USD!")
  }

  # alert user if there is any NA in the dataset ----
  if (sum(is.na(data) != 0) ){
    usethis::ui_stop("NA value(s) found at dataset. Please check!")
  }

  # alert user if there any of the variables product, price_EUR or price_USD is
  # missing ----
  if (!all("product" %in%  colnames(data),
          "price_EUR" %in%  colnames(data),
          "price_USD" %in%  colnames(data))){
    usethis::ui_stop("One or more required columns are missing from dataset")
  }

  discount_date <- "2020-11-27"

  discount <- ifelse(currency == "EUR", 0.2, 0.25)
  discount <- ifelse(Sys.Date() == as.Date(discount_date), 0.5, discount)
  order_currency_column <- data %>% dplyr::select(paste0("price_", currency))
  total <- sum(order_currency_column) * (1 - discount)
  return(total)
}
