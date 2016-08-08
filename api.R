require(httr)
require(xml2)
source('api_credentials.R', local=TRUE)

authenticate <- function() {
  # body params must be set in list. Add .env get that will fetch these items
  body  <- list(email = pardot_email, password = pardot_password, user_key = pardot_user_key)

  # make initial API call to authenticate
  fetch_api_call <- POST("https://pi.pardot.com/api/login/version/3", body= body)

  # returns xml node with <api_key>
  api_key <- xml_text(content(fetch_api_call))
}
