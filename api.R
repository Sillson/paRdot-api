require(httr)
require(xml2)
require(jsonlite)

authenticate <- function() {
  # body params must be set in list. Add .env get that will fetch these items
  auth_body  <- list(email = Sys.getenv("PARDOT_EMAIL"), 
                    password = Sys.getenv("PARDOT_PASSWORD"), 
                    user_key = Sys.getenv("PARDOT_USER_KEY"))

  # make initial API call to authenticate
  fetch_api_call <- POST("https://pi.pardot.com/api/login/version/3", body= auth_body)

  # returns xml node with <api_key>
  api_key <<- xml_text(content(fetch_api_call))
}

pardot_client <- function(params) {
  
  if (is.null(api_key)) {
    authenticate()
  }

  request_body <- build_url(params)
  api_call(request_body)
}

api_call <- function(request_body) {
  GET(request_body)
}

build_url <- function(params) {
  api_object <- 
  api_operator <- 
  api_identifier_field <- 
  api_identifier <- 
  api_request_params <- 
  api_format <- 

  cat("https://pi.pardot.com/api/",api_object,"/version/3/do/"api_operator"/"api_identifier_field"/"api_identifier"?api_key=",api_key,"&user_key=",Sys.getenv("PARDOT_USER_KEY"),"&",api_request_params,"&format=",api_format)
}
