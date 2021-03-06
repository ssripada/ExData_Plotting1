setwd("D:/One Drive/Coursera/Exploratory Data Analysis/Assignments/Week 1/Data/exdata-data-household_power_consumption")
install.packages("sqldf")
library(sqldf)
## Read subset of data using read.csv.sql
data<-read.csv.sql("household_power_consumption.txt",header=TRUE,sep=";",sql="Select * from file where Date='1/2/2007' OR Date='2/2/2007'") 

##Convert dates
?strptime
#1/2/2007
data$Date<-strptime(x = data$Date,format = "%d/%m/%Y" )

##plot1
##Initiating png graphic device
png(filename = "plot1.png",width = 480,height = 480)
#plotting the histogram
hist(x = data$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power",breaks=12)
?hist
#turning off the device
dev.off()