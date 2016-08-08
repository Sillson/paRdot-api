#' Set the Pardot user credentials
#'
#' Simple function to set the pardot ENV credentials in an R environment variable
#' \dontrun{
#' set_token("insert-your-token-here")}


set_username <- function(pardot_username){
    if(!is.null(pardot_username)){
        .paRdotEnv$data$pardot_username <- pardot_username
    }
    else{
        warning("Warning -- Pardot credentials must be set!")
    }
}

set_password <- function(pardot_password){
    if(!is.null(pardot_password)){
        .paRdotEnv$data$pardot_password <- pardot_password
    }
    else{
        warning("Warning -- Pardot credentials must be set!")
    }
}

set_user_key <- function(pardot_user_key){
    if(!is.null(pardot_user_key)){
        .paRdotEnv$data$pardot_user_key <- pardot_user_key
    }
    else{
        warning("Warning -- Pardot credentials must be set!")
    }
}
