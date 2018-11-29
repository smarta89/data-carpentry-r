#if in tidyverse - read_csv
# interviews<-read_csv("data/SAFI_clean.csv",na="NULL")
#if Base R - read.csr
# interviews<-read.csv("data/SAFI_clean.csv",na="NULL",stringsAsFactors=FALSE)
#if Base R using options
# options(stringsAsFactors=FALSE)
# interviews<-read.csv(data?SAFI_clean.csv", na="NULL")

respondent_floor_type<-factor(c("earth", "cement", "cement", "earth")) #convert to factors, make floortype a factor
respondent_floor_type
levels(respondent_floor_type) #to find out the levels of the factor
nlevels(respondent_floor_type) #to find out no. levels
respondent_floor_type<-factor(respondent_floor_type,levels=c("earth", "cement")) #to switch levels around
levels(respondent_floor_type)
levels(respondent_floor_type)[2] #to see the second level
levels(respondent_floor_type)[2]<-"brick" #changed second level to brick, rename
levels(respondent_floor_type)
as.character(respondent_floor_type) #converts them back to characters, no longer levels of the factor
#factors use less memory. 
#ordering of levels can be important
#factors are stored in memory as numbers (category 1,2,3,etc). be careful not to add/subtract those
year_fct<-factor(c(1990, 1983, 1998, 1990)) #create year factors
as.numeric(year_fct)#to convert back to numbers, but does not store them as the years they are, instead each year is reprsented by numbers =CONFUSING, BE CAREFUL
as.numeric(as.character(year_fct)) #way around above problem
as.numeric(levels(year_fct))[year_fct]

#example
affect_conflicts<-interviews$affect_conflicts #use $ instead of numbers to pull up a column, in this case affect_conflicts
affect_conflicts<-interviews[,"affect_conflicts"] #does same as above. 
affect_conflicts<-interviews[["affect_conflicts"]] #same thing again
affect_conflicts<-factor(affect_conflicts)
affect_conflicts

plot(affect_conflicts) #to plot(bargraph) this column
affect_conflicts<-interviews$affect_conflicts

affect_conflicts[is.na(affect_conflicts)]<-"undetermined" #to change NA to undertermined and count them as well
affect_conflicts #now missing values are replaced to the word undetermined
affect_conflicts<-factor(affect_conflicts) #convert to factor
plot(affect_conflicts) #to replot now with the undetermined counted

#exercise
#Factors 
#Rename the factor level “more_once” to “more than once”.
levels(affect_conflicts)[levels(affect_conflicts)=="more_once"]<-"more than once" #or use below if you know the number
#Can you recreate the barplot such that factor levels are ordered from least to most frequent (placing “undetermined” last)?

levels(affect_conflicts)[2]<-"more than once" #or use above if number is unknown
affect_conflicts<-factor(affect_conflicts, levels=c("never","once","more than once", "frequently", "undetermined"))
plot(affect_conflicts)

#MAKE SURE YOUR NAME CHANGES MATCH, IF THE PLOT IS NOT WORKING GO BACK A FEW STEPS AND BRING UP THE COLUMN AGAIN AND REDO STEPS

str(interviews)

#date is called POSIXct in R

library(lubridate) #converts into proper date format

dates<-interviews$interview_date
head(dates)
dates<-ymd_hms(dates) #extra step only needed if dates were not auto recognised 
str(dates)

interviews$day<-day(dates) #creating a new variable in interviews
interviews$month<-month(dates)
interviews$year<-year(dates)

