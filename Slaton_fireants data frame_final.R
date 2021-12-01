#version control
#https://github.com/birderbonnie/Slaton_Intro2R_Final-version-control.git

#10. Custom function(s) (10 points) 
 
#12. Using a 'apply', 'lapply', 'sapply' function (5 points) 
 #13. Reshaping data with spread() or gather() functions (5 points) 
#14. Reshaping data with 'melt' and/or 'dcast' (5 points) 

setwd("C:/Users/bslat/Desktop/BIO Intro to R/Slaton final project_IntrotoR") #read in data
library(tidyverse)
fireants <- readxl::read_xlsx("Data Frame TotalsCompiled.xlsx")
fireants
head(fireants)

ncol(fireants) #7    indexing
nrow(fireants)#63


y1<-fireants[1:29,]  #subset year 2018
y2<-fireants[30:48,] #subset year 2019
y3<-fireants[49:63,]#subset year 2021

raccoon<-fireants[,c("Year","Island","Totals")] #sorted data to make general observations about 
#when/where most ants were prevalent

raccoon

s<-fireants%>% group_by(Island)%>%summarise(mean.ants=mean(Totals))
head(s)
#used summarise function
#this returns a tibble showing that East Grand Terre had the highest average number of ants
#and Cheniere had the second highest average number of ants, Calumet had the least average # ants


## A tibble: 6 x 2
#Island               mean.ants
#<chr>                  <dbl>
# 1 Calumet             2.67
#2 Cheniere            450.  
#3 East Grand Terre    677.  
#4 Queen Bess            6.33
#5 Raccoon              56.6 
#6 Timbalier            16 


#pull out data 

f<-fireants[c("Year", "Island","Restoration","Transect","Totals")]
head(f)


f.1<-fireants[c("Date", "Island","Restoration","Transect","Totals")]
head(f.1)



#spread()

library(tidyverse)
head(f)
f.spread<-spread(f.1, "Date", "Totals", fill = NA, convert = FALSE) #wanted to compare date side by side to look at patterns with time of year/weather
f.spread
  



#using ddplyr
detach("package:tidyverse", unload = TRUE)
library(plyr)


ant.density<-ddply(.data = fireants, .variables = c("Island","Transect"), 
                   .fun = summarise, na.rm=TRUE ,average.ants = mean("Totals"))
ant.density
warning()#this gives warning message and average ants as NA


