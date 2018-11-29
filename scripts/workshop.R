## Use this file to follow along with the live coding exercises.
## The csv file containing the data is in the 'data/' directory.
## If you want to save plots you created, place them in the 'figures/' directory.
## You can create additional R files in the 'scripts/' directory.

library(tidyverse)
read_csv("data/SAFI_clean.csv")
interviews<-read_csv("data/SAFI_clean.csv", na="NULL")

interviews #object name to see what's there
as.data.frame(interviews) #to see more
View(interviews) #toview in spreadsheet format

#inspect data

dim(interviews) #view no. rows and columns
nrow(interviews) #view no. rows
ncol(interviews) #view no. columns

head(interviews) #view first few rows
head(as.data.frame(interviews)) #view first few as data frame
tail(interviews) #view last few rows

names(interviews) #list column names
str(interviews) #lists colum names and brief summary of each
summary(interviews) #summary of details about data

interviews[1, 1] #to view specific entry. row no., column no.
interviews[1:5,6] #to view data from rows 1 to 5, column 6
interviews[1,1:4] #to view data from first row, columns 1 to 4
interviews [1,1:ncol(interviews)] #if you don't know how many columns there are
interviews[1,] #will do same thing
interviews[,6]#for rows
interviews [6] #same thing, show column
interviews["respondent_wall_type"] #will give you the column with that particular name
interviews[,-1] #use neg no. to not show specified column

#exercise 1
interviews_100
interviews[100,] #view row 100 only

as.data.frame(interviews_last)
nrow(last)
interviews[nrow(interviews),] #to view last row

interviews_middle
interviews[nrow(interviews)/2,] #to view middle row

interviews[nrow(interviews1:6),]

#inIndexing data frames
# Create a data frame (interviews_100) containing only the data in row 100 of the interviews dataset.
interviews_100<-interviews[100,]
# Notice how nrow() gave you the number of rows in a data frame?
#   Use that number to pull out just that last row in the data frame.
interviews[nrow(interviews),]
# Compare that with what you see as the last row using tail() to make sure it’s meeting expectations.
tail(interviews)
# Pull out that last row using nrow() instead of the row number.
# Create a new data frame (interviews_last) from that last row.
interviews_last<-interviews[nrow(interviews),] #shortening codes so you don't have to rewrite the whole thing
# Use nrow() to extract the row that is in the middle of the data frame. Store the content of this row in an object named interviews_middle.
n_row<-nrow(interviews)
interviews[n_row/2,]
n_row
n_row/2
interviews[65,]
interviews[66,]
interviews[round(n_row/2),]
interviews[ceiling(n_row/2),] #safeest way to find middle row
# Combine nrow() with the - notation above to reproduce the behaviour of head(interviews), keeping just the first through 6th rows of the interviews dataset.
interviews[-(7:nrow(interviews)),] #show first 6 rows only by emitting rows 7 onwards

