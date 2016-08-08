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

paRdot <- function(object,operator,identifier_field=NULL,identifier=NULL) {
  # object & operator are required fields
  # identifier fields / identifier are optional
  # optional field to implement <- api_request_params,"&format=",api_format
  param_list <- (as.list(match.call()))
  if (is.null(api_key)) {
    authenticate()
  }

  request_url <- build_url(params)
  api_call(request_url)
}

api_call <- function(request_url) {
  resp <- GET(request_url)
  if ( resp$status != 200 ) {
    authenticate()
    resp <- GET(request_url)
  }
}

build_url <- function(param_list) {
  # required fields
  api_object = param_list$object
  api_operator = param_list$operator
  
  # optional fields
  api_identifier_field = scrub_opts(param_list$identifier_field)
  api_identifier = scrub_opts(param_list$identifier)

  cat("https://pi.pardot.com/api/",api_object,"/version/3/do/"api_operator,api_identifier_field,api_identifier"?api_key=",api_key,"&user_key=",Sys.getenv("PARDOT_USER_KEY"),"&")
}

scrub_opts <- function(opt) {
  if( is.null(opt) || opt == '' ) {
    return('/')
  } else {
    new_opt <- cat('/',opt)
    return(gsub(' ', '', new_opt))
  }
}
