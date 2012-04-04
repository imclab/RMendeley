#'authoredPubs - allows authenticated users to retrieve their own publications.
#'
#'@param mendeley_cred OAuth object of class MendeleyCredentials
#'@param curl If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options (debugging tools mostly).
#'@export
#'@examples \dontrun{
#' user_authored_pubs(mendeley_cred)
#'}
authoredPubs <- function(mendeley_cred = NULL, ..., curl = getCurlHandle()) {
    if (!is(mendeley_cred, "MendeleyCredentials") || missing(mendeley_cred))
        stop("Invalid or missing Mendeley credentials. ?mendeley_auth for more information.",
            call. = FALSE)
    au_pubs <- OAuthRequest(mendeley_cred, "http://api.mendeley.com/oapi/library/documents/authored/",
        , "GET")
    au_pubs <- fromJSON(au_pubs)
    return(au_pubs)
}
