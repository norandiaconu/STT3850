Title
========================================================

This is an R Markdown document. Markdown is a simple formatting syntax for authoring web pages (click the **Help** toolbar button for more details on using R Markdown).

When you click the **Knit HTML** button a web page will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:


```r
site <- "http://www1.appstate.edu/~arnholta/Data/FlightDelays.csv"
FD <- read.csv(site)
ANS <- tapply(FD$Delay > 28, FD$Carrier, mean)
ANS
```

```
##     AA     UA 
## 0.1418 0.1870
```

```r
OS <- ANS[1] - ANS[2]
names(OS) <- NULL
OS
```

```
## [1] -0.04522
```

```r
T1 <- xtabs(~Carrier, data = FD)
T1
```

```
## Carrier
##   AA   UA 
## 2906 1123
```

```r
a <- 2906 - 1123
a
```

```
## [1] 1783
```

