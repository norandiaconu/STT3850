# Homework Number 1
## Names: FirstName1 LastName1, FirstName1 LastName2, FirstName3 LastName3




This work was last compiled on Tuesday, February 04, 2014 - 10:42:08 AM.


```
## Warning: package 'ggplot2' was built under R version 3.0.2
```


**Prob 1:** Access the data from URL 
[http://www.stat.berkeley.edu/users/statlabs/data/babies.data](http://www.stat.berkeley.edu/users/statlabs/data/babies.data),
and store the information in an object named `BABIES` using the function 
`read.table()`. A description of the variables can be found at
[http://www.stat.berkeley.edu/users/statlabs/labs.html](http://www.stat.berkeley.edu/users/statlabs/labs.html).  These data are a subset from a much larger study dealing with 
child health and development.  Use the functions `summary()` and `dim()` on `BABIES`, and report the number of rows and columns of `BABIES`.


```r
# 
BABIES <- read.table("http://www.stat.berkeley.edu/users/statlabs/data/babies.data", header = TRUE)
summary(BABIES)
```

```
      bwt        gestation       parity           age           height         weight        smoke      
 Min.   : 55   Min.   :148   Min.   :0.000   Min.   :15.0   Min.   :53.0   Min.   : 87   Min.   :0.000  
 1st Qu.:109   1st Qu.:272   1st Qu.:0.000   1st Qu.:23.0   1st Qu.:62.0   1st Qu.:115   1st Qu.:0.000  
 Median :120   Median :280   Median :0.000   Median :26.0   Median :64.0   Median :126   Median :0.000  
 Mean   :120   Mean   :287   Mean   :0.255   Mean   :27.4   Mean   :64.7   Mean   :154   Mean   :0.464  
 3rd Qu.:131   3rd Qu.:288   3rd Qu.:1.000   3rd Qu.:31.0   3rd Qu.:66.0   3rd Qu.:140   3rd Qu.:1.000  
 Max.   :176   Max.   :999   Max.   :1.000   Max.   :99.0   Max.   :99.0   Max.   :999   Max.   :9.000  
```

```r
dim(BABIES)
```

```
[1] 1236    7
```


> **Prob 1 answer:** There are **1236** rows and **7** columns in the data frame `BABIES`.

**Prob 2:** The variables `bwt`, `gestation`, `parity`, `age`, `height`, `weight`, and `smoke` use values of 999, 999, 9, 99, 99, 999, and 9, respectively, to denote ''unknown.''  `R` uses `NA` to denote a missing or unavailable value.  Re-code the missing values in `BABIES`.  Hint: use something similar to `BABIES$bwt[BABIES$bwt == 999] = NA`.  Run the functions `summary()` and `dim()` on your `BABIES` data frame.


```r
BABIES$bwt[BABIES$bwt == 999] = NA
BABIES$gestation[BABIES$gestation == 999] = NA
BABIES$parity[BABIES$parity == 9] = NA
BABIES$age[BABIES$age == 99] = NA
BABIES$height[BABIES$height == 99] = NA
BABIES$weight[BABIES$weight == 999] = NA
BABIES$smoke[BABIES$smoke == 9] = NA
summary(BABIES)
```

```
      bwt        gestation       parity           age           height       weight        smoke      
 Min.   : 55   Min.   :148   Min.   :0.000   Min.   :15.0   Min.   :53   Min.   : 87   Min.   :0.000  
 1st Qu.:109   1st Qu.:272   1st Qu.:0.000   1st Qu.:23.0   1st Qu.:62   1st Qu.:115   1st Qu.:0.000  
 Median :120   Median :280   Median :0.000   Median :26.0   Median :64   Median :125   Median :0.000  
 Mean   :120   Mean   :279   Mean   :0.255   Mean   :27.3   Mean   :64   Mean   :129   Mean   :0.395  
 3rd Qu.:131   3rd Qu.:288   3rd Qu.:1.000   3rd Qu.:31.0   3rd Qu.:66   3rd Qu.:139   3rd Qu.:1.000  
 Max.   :176   Max.   :353   Max.   :1.000   Max.   :45.0   Max.   :72   Max.   :250   Max.   :1.000  
               NA's   :13                    NA's   :2      NA's   :22   NA's   :36    NA's   :10     
```

```r
dim(BABIES)
```

```
[1] 1236    7
```


**Prob 3:** Use the function `na.omit()` to create a ''clean'' data set that removes subjects if any observations on the subject are ''unknown.''   Store the modified data frame in a data frame named `CLEAN`.  Run the function `dim()` on the data frame `CLEAN`.  



```r
CLEAN <- na.omit(BABIES)
dim(CLEAN)
```

```
[1] 1174    7
```


**Prob 4:** How many missing values in the data frame `BABIES` are there for `gestation`, `age`, `height`, `weight`, and `smoke`, respectively?  How many rows of `BABIES` have no missing values, one missing value, two missing values, and three missing values, respectively?  Note: the number of rows in `CLEAN` should agree with your answer for the number of rows in `BABIES` that have no missing values.


```r
sum(is.na(BABIES$gestation))
```

```
[1] 13
```

```r
sum(is.na(BABIES$age))
```

```
[1] 2
```

```r
sum(is.na(BABIES$height))
```

```
[1] 22
```

```r
sum(is.na(BABIES$weight))
```

```
[1] 36
```

```r
sum(is.na(BABIES$smoke))
```

```
[1] 10
```

```r
table(apply(is.na(BABIES), 1, sum))
```

```

   0    1    2    3 
1174   43   17    2 
```


> **Prob 4 answer:** 
1174, 43, 17, 2

**Prob 5:** Sort the values in `CLEAN` by `bwt`, `gestation`, and `age`.  Store the sorted values in a data frame named `BGA` and show the last six rows of `BGA`.


```r
# BGA<-CLEAN[order(CLEAN$bwt,CLEAN$gestation,CLEAN$age),]) BGA<-CLEAN[order(CLEAN$bwt,CLEAN$gestation,CLEAN$age)]
BGA <- CLEAN[1:4]
summary(BGA)
```

```
      bwt        gestation       parity           age      
 Min.   : 55   Min.   :148   Min.   :0.000   Min.   :15.0  
 1st Qu.:108   1st Qu.:272   1st Qu.:0.000   1st Qu.:23.0  
 Median :120   Median :280   Median :0.000   Median :26.0  
 Mean   :119   Mean   :279   Mean   :0.262   Mean   :27.2  
 3rd Qu.:131   3rd Qu.:288   3rd Qu.:1.000   3rd Qu.:31.0  
 Max.   :176   Max.   :353   Max.   :1.000   Max.   :45.0  
```

```r
# 
```


**Prob 6:** Store the data frame `CLEAN` in your working directory as a `*.csv` file using the function `write.csv()` using the argument `row.names = FALSE`.
Use the function `read.csv()` to read the file back in to your working directory and store
the result in `NAELC`.  Show the first six rows of the data frame `NAELC`.  


```r
# 
```


**Prob 7:** What percent of the women in `CLEAN` are pregnant with their first child (`parity = 0`) and do not smoke?


```r
# 
```


> **Prob 7 answer:** 

**Prob 8:** Use the information in `CLEAN` to create a density histogram of the birth weights of babies whose mothers have never smoked (`smoke = 0`) and another histogram placed directly below the first in the same graphics device for the birth weights of babies whose mothers currently smoke (`smoke = 1`).  Make the range of the $x$-axis 50 to 180 (ounces) for both histograms.  Superimpose a density curve over each histogram, and label the $x$-axis "Weight in Ounces".  *Extra credit if you create the requested graph with the three graphic systems (base, lattice, and ggplot2).*


```r
# 
```



```r
# 
```




```r
# 
```


**Prob 9:** Based on the histograms, characterize the distribution of baby birth weight for both non-smoking and smoking mothers.


```r
# 
```


> **Prob 9 answer:** 

**Prob 10:** Create side-by-side boxplots to compare the birth weights of babies whose mother's never smoked and those who currently smoke.  Use base graphs (`boxplot()`), lattice graphs (`bwplot()`), and ggplot2 graphs to create the boxplots.  Label the $y$-axis "Weight in Ounces".


```r
# 
```



```r
# 
```



```r
# 
```


**Prob 11:** What is the median weight difference between babies who are firstborn
(`parity = 0`) and those who are not (`parity = 1`)?


```r
# 
```


> **Prob 11 answer:** 

**Prob 12:** Create a single graph of the densities for pre-pregnancy `weight` for mothers who have never smoked and for mothers who currently smoke.  Make sure both densities appear in the same graph and have a legend.  Label the $x$-axis "Weight in Pounds".  *Extra credit if you create the requested graph using base, lattice, and ggplot2 graphics.*


```r
# 
```



```r
# 
```



```r
# 
```


**Prob 13:** Characterize the pre-pregnancy distribution of `weight` for mothers who have never smoked and for mothers who currently smoke.


```r
# 
```


> **Prob 13 answer:** 

**Prob 14:** What is the mean pre-pregnancy weight difference between mothers who do not smoke and those who do?  Can you think of any reasons not to use the mean as a measure of center to compare pre-pregnancy weights in this problem?


```r
# 
```


> **Prob 14 answer:** 


**Prob15:** Compute the body mass index (`BMI`) for each mother in `CLEAN`.  Recall that `BMI` is defined as $\text{kg}/\text{m}^2$ (0.0254 m = 1 in., and 0.45359 kg = 1 lb.).  Add the variables weight in kg, height in m, and BMI to `CLEAN` and store the result in `CLEANP`.  Show the first six rows of `CLEANP`.


```r
# 
```


**Prob 16:** Characterize the distribution of BMI.  Create either a histogram or density plot to
help determine the shape of the BMI distribution.  Label the $x$-axis "BMI ($kg/m^2$)".


```r
# 
```


> **Prob 16 answer:** 

**Prob 17:** Group pregnant mothers according to their BMI quartile. Find the mean and standard deviation for baby birth weights in each quartile for mothers who have never smoked and those who currently smoke.   Find the median and IQR for baby birth weights in each quartile for mothers who have never smoked and those who currently smoke. Based on your answers, would you characterize birth weight in each group as relatively symmetric or skewed? Create histograms and densities of `bwt` conditioned on `BMI` quartiles and whether the mother smokes to verify your previous assertions about the shape.


```r
# 
```



```r
# 
```



```r
# 
```


> **Prob 17 answer:**  

**Prob 18:** Create side-by-side boxplots of `bwt` based on whether the mother
smokes conditioned on `BMI` quartiles.  What do you notice using the boxplots?


```r
# 
```


> **Prob 18 answer:** 


**Prob 19:** Does it appear that BMI is related to the birth weight of a baby? Create a scatterplot of birth weight (`bwt`) versus `BMI` while conditioning on BMI quartiles and whether the mother smokes to help answer the question.  Use `log(bwt)` on the $y$-axis instead of the untransformed `bwt`.


```r
#
```


> **Prob 19 answer:** 


**Prob 20:** Create a scatterplot of `bwt` versus `gestation` conditioned on BMI quartiles and whether the mother smokes using `ggplot2` graphics.  Fit curves to the data using `loess` and `lm` (`stat_smooth()`); and display the fitted curves in the scatterplots. What do you find interesting about the resulting graphs? 


```r
# 
```


> **Prob 20 answer:**  
