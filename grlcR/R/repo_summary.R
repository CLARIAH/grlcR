#' Retrieve SPARQL queries from grlc repo
#'
#' This function retrieves the available sparql queries from a grlc repo
#' @param a grlc repo owner/project
#' @keywords grlc
#' @importFrom httr content
#' @importFrom httr GET
#' @export
#' @examples
#' repo_summary()
#' 
repo_summary <- function(git) {
    base_url <- paste0("http://grlc.io/api/", git)
    spec  <- paste0(base_url, "/spec")
    cont <- httr::content(httr::GET(url = spec))
    len  <- as.numeric(length(cont$paths))
    #unlist(lapply(1:3, function(x) cont$paths[[x]]$get$summary))
    query_names <- names(cont$paths)
    list(url = base_url, queries = query_names)
}
