# grlcR
R package to retrieve sparql queries stored in grlc format

To install from R, run:

```
install_github("CLARIAH/grlcR", subdir = "pkg")
```

```
# Examples
repo.summary("albertmeronyo/lodapi")

# not run
# repo.summary("CLARIAH/wp4-queries") #takes forever

# retrieve results from sparql query
hisq <- repo.summary("CLARIAH/wp4-queries-hisco")
hisq
repo.query(hisq, 2) # 2 being second of the sparql queries
```
