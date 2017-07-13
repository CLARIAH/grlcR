#' Retrieve SPARQL results from grlc repo
#'
#' This function retrieves data from the grlc-repo sparql query
#' @param object from repo summary; object number
#' @keywords grlc
#' @importFrom jsonlite fromJSON
#' @export
#' @examples
#' repo.query()
#' 
repo.query <- function(query, number) {
    # load libraries
    query_url <- paste0(query$url, '/', query$queries[number],'.json')
    df <- jsonlite::fromJSON(query_url)
    df$results$bindings
}