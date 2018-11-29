#dplyer and tidyr
library(tidyverse)
interviews<-read_csv("data/SAFI_clean.csv",na="NULL")
select(interviews,village, no_membrs,years_liv) #selects specified columns
select(interviews, village:rooms) #select columns from vil to room

#filtering
filter(interviews, village == "God",rooms>2) #to select village with specified name
filter(interviews,1:nrow(interviews)%in%1:10) #same as above

interviews2<-filter(interviews, village=="God")
interviews_god<-select(interviews2, no_membrs, years_liv)
interviews_god<-select(filter(interviews, village=="God')), no_membrs, years live"
                              
#Pipes

interviews %>%filter(village=="God")%>%select(no_membrs,years_liv)                           
interviews_god<-interviews %>%filter(village=="God")%>%select(no_membrs,years_liv)

# Pipes
#exercise
# Using pipes, subset the interviews data to include interviews where respondents were members of an irrigation association (memb_assoc) and retain only the columns affect_conflicts, liv_count, and no_meals.
interviews%>%filter(memb_assoc=="yes")%>%select(affect_conflicts, liv_count, no_meals)

#mutate

interviews<-interviews%>%mutate(people_per_room=no_membrs/rooms) #interviews<- used to add this data to this particular table

#group by

mean(interviews$no_membrs)
interviews%>%group_by(village) #to specify variables in data to distinguish between groups, eg group data by village. for this to work it must also be piped
interviews%>%group_by(village)%>%summarize(mean_no_membrs=mean(no_membrs)) #to get the mean no members for each village
interviews%>%group_by(village)%>%filter(memb_assoc=="yes")%>%summarize(mean_no_membrs=mean(no_membrs)) #mean members per cvillage with associations
interviews%>%group_by(village,memb_assoc)%>%summarize(mean_no_membrs=mean(no_membrs)) #mean people per village and their membership status
interviews%>%group_by(village,memb_assoc)%>%summarize(mean_no_membrs=mean(no_membrs),min_members=min(no_membrs)) #same as above indlucing the min number as well

#count

interviews%>%count(village) #to count how many entries there are for each
interviews%>%count(village,sort=TRUE) #same as above but sorted

#exercise
#Use group_by() and summarize() to find the mean, min, 
#and max number of household members for each village. Also, add the number of observations.
#Hint: see ?n

?n #help menu for n: the number of obs in current group

interviews%>%group_by(village)%>%summarize(mean_no_membrs=mean(no_membrs), min_members=min(no_membrs), max_members=max(no_membrs))

interviews%>%group_by(village)%>%summarize(mean_no_membrs=mean(no_membrs), min_members=min(no_membrs), max_members=max(no_membrs),n=n())

# Reshaping 

interviews<-(interviews%>%mutate(wall_type_logical=TRUE)%>%spread(key=respondent_wall_type,value=wall_type_logical,fill=FALSE))
#to view each variable in a seperate column, including changeing missing values to FALSE

interviews<-interviews%>%gather(key=respndent_wall_type, value="wall_type_logical",burntbricks:sunbricks) #to regather seperated things in previous step

#prepare
interviews<-read_csv("data/SAFI_clean.csv",na="NULL") #reload original dataset to get fresh start for plotting

interviews_plotting<-interviews%>%
  mutate(split_items=strsplit(items_owned,";"))%>%
  unnest()%>%
  mutate(items_owned_logical=TRUE)%>%
  spread(key=split_items,value=items_owned_logical,fill=FALSE)%>%
  rename(no_listed_items='<NA>')%>%
  mutate(split_months=strsplit(months_lack_food,";"))%>%
  unnest()%>%
  mutate(months_lack_food_logical=TRUE)%>%
  spread(key=split_months,value=months_lack_food_logical,fill=FALSE)%>%
  mutate(number_months_lack_food=rowSums(select(.,Apr:Sept)))%>%
  mutate(number_items=rowSums(select(.,bicycle:television)))

write_csv(interviews_plotting,path"data_output")