#' Retrieve the 'value' (last part) of a uri
#'
#' @param a uri
#' @return The value after the last '/' of a \uri_value{x}
#' @importFrom stringr str_sub str_extract str_replace
#' @examples
#' uri_value("http://example.com/myvalues/1234")
#' uri_value("http://example.com/myvalues/bookstore/") # warns for trailing slash
#' 

uri_value <- function(x) {
    #--- check whether string is uri (stop if not)
    if(stringr::str_sub(x, 1, 4) != "http") {
        stop(paste0("Error: iri_value expects a uri as input. E.g. 
             'http://bla.com/bla'.", " You provided: \n'", x, "'"))
    }
    
    #--- check whether uri does not end on '/' and remove + warning
    if(stringr::str_extract(x, '.$') == "/") {
        x <- stringr::str_replace(x, "/+$", "")
        warning('Removed trailing "/", but expected none as value uri should not end on "/"')
    }
        
    #--- return value after last slash
    stringr::str_extract(x, '\\b[^/]*$')
}
