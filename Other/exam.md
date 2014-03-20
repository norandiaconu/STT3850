Title
========================================================

This is an R Markdown document. Markdown is a simple formatting syntax for authoring web pages (click the **Help** toolbar button for more details on using R Markdown).

When you click the **Knit HTML** button a web page will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:


```r
site <- "http://www1.appstate.edu/~arnholta/Data/FlightDelays.csv"
FD <- read.csv(site)
FD[1:4, 1:9]
```

```
##   ID Carrier FlightNo Destination DepartTime Day Month FlightLength Delay
## 1  1      UA      403         DEN      4-8am Fri   May          281    -1
## 2  2      UA      405         DEN     8-Noon Fri   May          277   102
## 3  3      UA      409         DEN      4-8pm Fri   May          279     4
## 4  4      UA      511         ORD     8-Noon Fri   May          158    -2
```

```r
DAA <- subset(FD, select = Delay, subset = Carrier == "AA", drop = T)
DUA <- subset(FD, select = Delay, subset = Carrier == "UA", drop = T)
DA <- c(DAA, DUA)
m <- length(DAA)
N <- 10^4 - 1
sum <- 0
for (i in 1:N) {
    if (DA$DelayTime > 28) {
        sum <- sum + 1
    }
}
```

```
## Error: $ operator is invalid for atomic vectors
```

