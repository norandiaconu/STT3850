library(MASS)
str(quine)
Mdays<-quine$days[quine$Sex=="M"]
Mdays<-quine$Days[quine$Sex=="M"]
Fdays<-quine$Days[quine$Sex=="F"]
mean(Mdays)
[1] 17.95455
mean(Fdays)
[1] 15.225
SlowMiss<-quine$Days[quine$Lrn=="SL"]
mean(SlowMiss)
[1] 17.30159
SlowMalesMiss<-quine$Days[quine$Lrn=="SL"&quine$Sex=="M"]
mean(SlowMalesMiss)
[1] 18.3913
tapply(quine$Days,quine$Sex,mean)
F        M 
15.22500 17.95455 
tapply(quine$Days,list(quine$Sex,quine$Lrn),mean)
AL      SL
F 13.77500 16.6750
M 17.72093 18.3913
tapply(quine$Days,list(quine$Sex,quine$Lrn),median)
AL   SL
F 10.5  8.5
M 14.0 11.0
hist(SlowMalesMiss)
hist(SlowMalesMiss, main="Histogram of Days Missed by SLow Learners")
hist(SlowMalesMiss, main="Histogram of Days Missed by Male Slow Learners")
hist(SlowMalesMiss, main="Histogram of Days Missed\nby Male Slow Learners")
hist(SlowMalesMiss, main="Histogram of Days Missed\nby Male Slow Learners",xlab="Days Missed")
hist(SlowMalesMiss, main="Histogram of Days Missed\nby Male Slow Learners",xlab="Days Missed",col="blue")
plot(density(SlowMalesMiss))
boxplot(SlowMalesMiss)
boxplot(SlowMalesMiss,horizontal=TRUE)
boxplot(SlowMalesMiss,horizontal=TRUE,col="red",main="Boxplot of stuff")
boxplot(SlowMalesMiss,horizontal=TRUE,col="red",main="Boxplot of stuff",xlab="Days Missed")
T1<-table(quine$Lrn,quine$Sex)
barplot(T1)
barplot(T1,legend=TRUE,beside=TRUE,col=c("green","yellow"))
library(lattice)
histogram(~Days,data=quine)
histogram(~Days|Sex,data=quine)
histogram(~Days|Sex*Lrn,data=quine)
histogram(~Days|Sex*Age,data=quine)
histogram(~Days|Sex+Age,data=quine)
histogram(~Days|Sex*Age,data=quine,layout=c(4,2))
densityplot(~Days|Sex*Age,data=quine,layout=c(4,2))
bwplot(Sex~Days|Lrn,data=quine)
library(PASWR)
str(EPIDURALf)
?EPIDURALf
xyplot(kg~cm|Treatment,data=EPIDURALf,type=c("p","r"))
xyplot(kg~cm|Treatment*Ease,data=EPIDURALf,type=c("p","r"))
FL<-read.csv("http://www1.appstate.edu/~arnholta/Data/FlightDelays.csv")
