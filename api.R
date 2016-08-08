require(httr)
require(xml2)

authenticate <- function() {
  # body params must be set in list. Add .env get that will fetch these items
  auth_body  <- list(email = Sys.getenv("PARDOT_EMAIL"), 
                    password = Sys.getenv("PARDOT_PASSWORD"), 
                    user_key = Sys.getenv("PARDOT_USER_KEY"))

  # make initial API call to authenticate
  fetch_api_call <- POST("https://pi.pardot.com/api/login/version/3", body= auth_body)

  # returns xml node with <api_key>
  api_key <- xml_text(content(fetch_api_call))
}

pardot_client <- function(params) {
  
  if (is.null(api_key)) {
    authenticate
  }

  api_call(params)
}

api_call <- function(params) {
  GET("https://pi.pardot.com/api/<object>/version/3/do/query/<identifier_field>/<identifier>?api_key=<your_api_key>&user_key=<your_user_key>&<parameters_for_request>")
}
