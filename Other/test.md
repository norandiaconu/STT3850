Title
========================================================

This is an R Markdown document. Markdown is a simple formatting syntax for authoring web pages (click the **Help** toolbar button for more details on using R Markdown).

When you click the **Knit HTML** button a web page will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:


```r
summary(cars)
```

```
##      speed           dist    
##  Min.   : 4.0   Min.   :  2  
##  1st Qu.:12.0   1st Qu.: 26  
##  Median :15.0   Median : 36  
##  Mean   :15.4   Mean   : 43  
##  3rd Qu.:19.0   3rd Qu.: 56  
##  Max.   :25.0   Max.   :120
```


You can also embed plots, for example:


```r
plot(cars)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


site <- "http://www1.appstate.edu/~arnholta/PASWR/CD/data/Poplar3.CSV"
poplar <- read.csv(file=site)
head(poplar, n = 5)
tail(poplar)
str(poplar)
summary(poplar)

poplarC <- read.csv(file=url(site), na.strings="-99", colClasses=c(rep("factor",3),rep("numeric",3),"factor"))
str(poplarC)
summary(poplarC)
poplarC$Height
plot(poplarC$Height,poplarC$Weight)
poplarC$Height[poplarC$Height > 8]
poplarC$Height[1:10]
dim(poplarC)

?read.csv()
