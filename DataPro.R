
rm(list = ls())

library(haven)
library(dplyr)

setwd("C:/Users/DH/Downloads")
Data <- read.csv("C:/Users/DH/Downloads/DataSet.txt")

#### Data processing for key data

#1. flow per country, I assumed that 1 is a output (export or sell) and 2 is an input (import or buy)

EURFlow<- Data%>%group_by(DECLARANT_ISO, TRADE_TYPE,FLOW)%>%summarise("total"=sum(VALUE_IN_EUROS))
EURFlow<- EURFlow%>%mutate(share=total/sum(total))
write.csv(EURFlow,"EURFlow.csv")

#2. Quantity of flow in Kg per country

EURShare<- Data%>%group_by(DECLARANT_ISO,FLOW)%>%summarise("total"=sum(QUANTITY_IN_KG))
EURShare<- EURShare%>%mutate(share=total/sum(total))
write.csv(EURShare,"EURShare.csv")

#### charts made in excel