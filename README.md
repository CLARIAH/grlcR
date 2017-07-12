# grlcR
R package to retrieve sparql queries stored in grlc format


```
# Examples
sum.grlc("albertmeronyo/lodapi")

# not run
# sum.grlc("CLARIAH/wp4-queries") #takes forever

# retrieve results from sparql query
hisq <- sum.grlc("CLARIAH/wp4-queries-hisco")
hisq
sparql.grlc(hisq, 2) # 2 being second of the sparql queries
```
