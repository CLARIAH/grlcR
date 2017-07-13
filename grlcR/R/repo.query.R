#' Retrieve SPARQL results from grlc repo
#'
#' This function retrieves data from the grlc-repo sparql query
#' @param object from repo summary; object number
#' @keywords grlc
#' @export
#' @examples
#' repo.query()
#' 
repo.query <- function(query, number) {
    require(jsonlite)
    query_url <- paste0(query$url, '/', query$queries[number],'.json')
    df <- fromJSON(query_url)
    df$results$bindings
}