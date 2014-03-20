Title
========================================================

This is an R Markdown document. Markdown is a simple formatting syntax for authoring web pages (click the **Help** toolbar button for more details on using R Markdown).

When you click the **Knit HTML** button a web page will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:


```r
library(ggplot2)
```

```
## Warning: package 'ggplot2' was built under R version 3.0.2
```

```r
# 3A
site <- "http://www1.appstate.edu/~arnholta/Data/FlightDelays.csv"
FD <- read.csv(site)
summary(FD)
```

```
##        ID       Carrier      FlightNo    Destination    DepartTime  
##  Min.   :   1   AA:2906   Min.   :  71   BNA: 172    4-8am   : 699  
##  1st Qu.:1008   UA:1123   1st Qu.: 371   DEN: 264    4-8pm   : 972  
##  Median :2015             Median : 691   DFW: 918    8-Mid   : 257  
##  Mean   :2015             Mean   : 827   IAD:  55    8-Noon  :1053  
##  3rd Qu.:3022             3rd Qu.: 787   MIA: 610    Noon-4pm:1048  
##  Max.   :4029             Max.   :2255   ORD:1785                   
##                                          STL: 225                   
##   Day       Month       FlightLength     Delay       Delayed30 
##  Fri:637   June:2030   Min.   : 68   Min.   :-19.0   No :3432  
##  Mon:630   May :1999   1st Qu.:155   1st Qu.: -6.0   Yes: 597  
##  Sat:453               Median :163   Median : -3.0             
##  Sun:551               Mean   :185   Mean   : 11.7             
##  Thu:566               3rd Qu.:228   3rd Qu.:  5.0             
##  Tue:628               Max.   :295   Max.   :693.0             
##  Wed:564
```

```r
str(FD)
```

```
## 'data.frame':	4029 obs. of  10 variables:
##  $ ID          : int  1 2 3 4 5 6 7 8 9 10 ...
##  $ Carrier     : Factor w/ 2 levels "AA","UA": 2 2 2 2 2 2 2 2 2 2 ...
##  $ FlightNo    : int  403 405 409 511 667 669 673 677 679 681 ...
##  $ Destination : Factor w/ 7 levels "BNA","DEN","DFW",..: 2 2 2 6 6 6 6 6 6 6 ...
##  $ DepartTime  : Factor w/ 5 levels "4-8am","4-8pm",..: 1 4 2 4 1 1 4 4 5 5 ...
##  $ Day         : Factor w/ 7 levels "Fri","Mon","Sat",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ Month       : Factor w/ 2 levels "June","May": 2 2 2 2 2 2 2 2 2 2 ...
##  $ FlightLength: int  281 277 279 158 143 150 158 160 160 163 ...
##  $ Delay       : int  -1 102 4 -2 -3 0 -5 0 10 60 ...
##  $ Delayed30   : Factor w/ 2 levels "No","Yes": 1 2 1 1 1 1 1 1 1 2 ...
```

```r
head(FD)
```

```
##   ID Carrier FlightNo Destination DepartTime Day Month FlightLength Delay
## 1  1      UA      403         DEN      4-8am Fri   May          281    -1
## 2  2      UA      405         DEN     8-Noon Fri   May          277   102
## 3  3      UA      409         DEN      4-8pm Fri   May          279     4
## 4  4      UA      511         ORD     8-Noon Fri   May          158    -2
## 5  5      UA      667         ORD      4-8am Fri   May          143    -3
## 6  6      UA      669         ORD      4-8am Fri   May          150     0
##   Delayed30
## 1        No
## 2       Yes
## 3        No
## 4        No
## 5        No
## 6        No
```

```r
DelayTime <- subset(FD, select = Delay, drop = T)
MEANS <- tapply(FD$Delay, FD$Carrier, mean)
obsDiff <- MEANS[1] - MEANS[2]
names(obsDiff) <- NULL
obsDiff
```

```
## [1] -5.886
```

```r

DAA <- subset(FD, select = Delay, subset = Carrier == "AA", drop = T)
DUA <- subset(FD, select = Delay, subset = Carrier == "UA", drop = T)
DA <- c(DAA, DUA)
m <- length(DAA)
n <- length(DUA)
c(m + n, m, n)
```

```
## [1] 4029 2906 1123
```

```r
N <- 10^4 - 1
DIFF <- numeric(N)
set.seed(13)
for (i in 1:N) {
    index <- sample(m + n, m, replace = F)
    DIFF[i] <- mean(DA[index]) - mean(DA[-index])
}
pvalue <- ((sum(DIFF <= obsDiff) + 1)/(N + 1)) * 2
pvalue
```

```
## [1] 2e-04
```

```r

table(FD$Carrier)
```

```
## 
##   AA   UA 
## 2906 1123
```

```r
T1 <- xtabs(~Carrier, data = FD)
m1 <- T1[1]  #2906
n1 <- T1[2]  #1123
N1 <- 10^4 - 1
diffs <- numeric(N)
for (i in 1:N1) {
    index <- sample(m1 + n1, m1, replace = F)
    diffs[i] <- mean(DelayTime[index]) - mean(DelayTime[-index])
}
hist(diffs)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-11.png) 

```r
ggplot(data = data.frame(x = diffs), aes(x = x)) + geom_density(fill = "black") + 
    theme_bw() + geom_vline(xintercept = obsDiff, lty = "dashed")
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-12.png) 

```r
pvalue <- ((sum(diffs <= obsDiff) + 1)/(N + 1)) * 2

# 3B
MEANS2 <- tapply(FD$Delay, FD$Month, mean)
obsDiff2 <- MEANS2[1] - MEANS2[2]
obsDiff2
```

```
##  June 
## 5.663
```

```r
table(FD$Month)
```

```
## 
## June  May 
## 2030 1999
```

```r
T2 <- xtabs(~Month, data = FD)
m2 <- T2[1]
n2 <- T2[2]
N2 <- 10^4 - 1
diffs2 <- numeric(N1)
for (i in 1:N2) {
    index2 <- sample(m2 + n2, m2, replace = F)
    diffs2[i] <- mean(DelayTime[index2]) - mean(DelayTime[-index2])
}

# 5
for (i in 1:N) {
    meanUADelay <- tapply(FD$Delay, data$Carrier, mean)
    sumUADelay <- tapply(FD$Delay, data$Carrier, sum)
    
}
```

```
## Error: object of type 'closure' is not subsettable
```

```r
meanUADelay <- MEANS[2]
```

