# The purpose of this file is to create a script to
# - 1. retrieve a summary of information from grlc-repo's
# - 2. execute a query from a grlc-repo
# - 3. add retrieved data to memory


# 1. retrieve a summary of all queries from grlc-repo

require(httr)

hisco <- "http://grlc.io/api/CLARIAH/"

# git
# should provide username and git-package
# CLARIAH/wp4-queries-hisco


sum.grlc <- function(git) {
    url <- paste0("http://grlc.io/api/",git,"/spec")
    cont <- content(GET(url=url))
    len <- as.numeric(length(cont$paths))
    unlist(lapply(1:3, function(x) cont$paths[[x]]$get$summary))
}

sum.grlc("CLARIAH/wp4-queries-hisco")
#sum.grlc("CLARIAH/wp4-queries") #takes forever
sum.grlc("albertmeronyo/lodapi")

