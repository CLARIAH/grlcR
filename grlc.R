# The purpose of this file is to create a script to
# - 1. retrieve a summary of information from grlc-repo's
# - 2. retrieve output from grlc-sparql query


# 1. retrieve a summary of all queries from grlc-repo
sum.grlc <- function(git) {
    base_url <- paste0("http://grlc.io/api/", git)
    spec  <- paste0(base_url, "/spec")
    cont <- content(GET(url = spec))
    len  <- as.numeric(length(cont$paths))
    #unlist(lapply(1:3, function(x) cont$paths[[x]]$get$summary))
    query_names <- names(cont$paths)
    list(url = base_url, queries = query_names)
}
# note, I now output the base_url and queries as list
# this is mainly necessary for the retrieval of the result of the sparql
# query. This should be done more elegantly using environments.


# 2. retrieve output from grlc-sparql query
sparql.grlc <- function(query, number) {
    require(jsonlite)
    query_url <- paste0(query$url, '/', query$queries[number],'.json')
    df <- fromJSON(query_url)
    df$results$bindings
}

# Example
hisco.queries <- sum.grlc("CLARIAH/wp4-queries-hisco")
hisco.queries
sum.grlc("albertmeronyo/lodapi")

# not run
# sum.grlc("CLARIAH/wp4-queries") #takes forever

# retrieve results from sparql query
sparql.grlc(hisco.queries, 2) # 2 being second of the sparql queries

# EOF
