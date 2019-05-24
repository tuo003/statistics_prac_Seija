library(tidyverse)
 
data <- read_csv("~/research.tuo/data_school_mine/stats/Comparison_Experiment_KCl_V_K2SO4.csv")

#ggplot(data2, aes(GeneB,LWR,colour=GeneA)) +   geom_boxplot() + geom_point()
glimpse(data)


#Comparison Experiment

#nitrogen<-read_csv("~/research.tuo/data_school_mine/stats/Comparison_Experiment_KCl_V_K2SO4.csv")

library(ggplot2)

#Import data and create new columns

K1<-read.csv("~/research.tuo/data_school_mine/stats/Comparison_Experiment_KCl_V_K2SO4.csv")
K1$Treatment<-rep(c("Urea","Water"), each=12, times=3)
K1$RepID<-with(K1,interaction(Treatment, Extractant, Soil))
K1$DON<-K1$TN_N_analy - K1$Sum_species


#Re-structure data

K2<-gather(K1, key=N_type,value=amount, c(7,9,11))
glimpse(K2)

#Visualising Data

ggplot((K2), aes(x=Soil, y=amount, colour=Extractant))+
  geom_boxplot()+
  facet_wrap(~ N_type) 

#ammonia in 3 soils
ggplot(K1,aes(Soil, y=NH3N_adjusted, colour=Extractant))+ 
  geom_boxplot()
#nitrate in 3 soils
ggplot(K1,aes(Soil, y=NO3_N_adjusted, colour=Extractant))+
  geom_boxplot()

#Urea in 3 soils
ggplot(K1,aes(Soil, y=Urea_N_adjusted, colour=Extractant))+
  geom_boxplot()

#TN in 3 soils
ggplot(K1,aes(Soil, y=TN_N_analy, colour=Extractant))+
  geom_boxplot()

#(TN analysed) - (Sum_species)
ggplot(K1,aes(Soil, y=DON, colour=Extractant))+
  geom_boxplot()

#Total inorganic nitrogen = Sum of all species
ggplot(K1,aes(Soil, y=Sum_species, colour=Extractant))+
  geom_boxplot()
glimpse(K1)


ggplot(K1, aes(Soil, log(NH3N_adjusted), colour=Extractant))+geom_boxplot()+
  facet_wrap(~Treatment)
ggplot(K1, aes(Treatment, log(NH3N_adjusted), colour=Extractant))+geom_boxplot()+
  facet_wrap(~Soil)
ggplot(K1, aes(Soil, log(NO3_N_adjusted), colour=Extractant))+geom_boxplot()+
  facet_wrap(~Treatment)
ggplot(K1, aes(Treatment, log(NO3_N_adjusted), colour=Extractant))+geom_boxplot()+
  facet_wrap(~Soil)
ggplot(K1, aes(Soil, log(Urea_N_adjusted), colour=Extractant))+geom_boxplot()+
  facet_wrap(~Treatment)
ggplot(K1, aes(Treatment, log(Urea_N_adjusted), colour=Extractant))+geom_boxplot()+
  facet_wrap(~Soil)


##Remove water from data

##Marginal Effects
K3<-subset(K1, Extractant != "H2O")

##Using log RE going up (homogenaity of variation)
library(lmerTest)
library(emmeans)
lm1<-lmer(log(NH3N_adjusted)~Extractant+Treatment+Soil +(1|RepID), data=K3)

anova(lm1)
summary(lm1)
## emmeans(lm, pairwise~Extractant,type="response")
emmeans(lm1, pairwise~Extractant,type="response")

plot(lm1)


##Factorial Model

lm2<-lmer(log(NH3N_adjusted)~Extractant*Soil +(1|RepID), data=K3)
anova(lm2)
summary(lm2)
emmeans(lm2,pairwise~Extractant|Soil, type="response")
emmeans(lm2,revpairwise~Extractant|Soil, type="response")

plot(lm2)

## Ho to add a verticalline toa plot


ggplot((K2), aes(x=Soil, y=amount, colour=Extractant))+
  geom_boxplot()+
  facet_wrap(~ N_type)+
  geom_hline(yintercept = 4.66)



                