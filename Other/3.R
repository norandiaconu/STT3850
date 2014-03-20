library(PASWR) #loading package PASWR
?EPIDURALf
EPIDURALf
head(EPIDURALf)
str(EPIDURALf)
EPIDURALf$BMI<-EPIDURALf$kg/(EPIDURALf$cm/100)^2
head(EPIDURALf)
EPI<-EPIDURALf
tapply(EPI$BMI,EPI$Treatment,mean)
#shape(hist,densityplot)
library(ggplot2)
p<-ggplot(data=EPI,aes(x=BMI))
p+geom_histogram()
p+geom_density() #is skewed right because tail is on the right
p+geom_density()+facet_grid(Treatment~.)
p+geom_density()+facet_grid(Treatment~Doctor)
p<-ggplot(data=EPI,aes(x=BMI,color=Treatment))
p+geom_density()+facet_grid(Treatment~Doctor)
#p+geom_boxplot(data=EPI,aes(x=BMI,y=Treatment))+facet_grid(.~Doctor)
cutpoints<-quantile(EPIDURALf$BMI,seq(0,1,length.out=5))
EPIDURALf$QUAR<-cut(EPIDURALf$BMI,cutpoints)
head(EPIDURALf)
library(ggplot2)
p<-ggplot(data=EPIDURALf,aes(x=cm,y=kg,color=Treatment))+geom_point(size=5)
p+geom_smooth()
p+geom_smooth(se=FALSE,size=5)
p+facet_grid(Treatment~QUAR)+geom_smooth()
