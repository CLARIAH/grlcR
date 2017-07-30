# grlcR
R package to retrieve sparql queries stored in grlc format

To install & load run:

```
# install.packages("devtools") # uncomment if not installed yet
devtools::install_github("CLARIAH/grlcR", subdir = "grlcR")
library(grlcR)
```

```
# Examples
repo_summary("albertmeronyo/lodapi")

# not run
# repo_summary("CLARIAH/wp4-queries") #takes forever

# retrieve results from sparql query
hisq <- repo_summary("CLARIAH/wp4-queries-hisco")
hisq
df <- repo_query(hisq, 2) # 2 being the second of the sparql queries in this repo
str(df) # notice that df exits of 2 data.frames

# extract values from a uri (e.g. retrieve 'value' from 'http(s)://.../..../value')
df$hisco$code <- sapply(df$hisco$value, uri_value)
df$hisco
```
