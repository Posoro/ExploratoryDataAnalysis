# Exercise 2: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?  

#set working directory
#> setwd("C:/Users/Administrator/Documents/01Data Science/001 Exp Data Analysis/Week3/exdata_data_NEI_data")
#> getwd()
# [1] "C:/Users/Administrator/Documents/01Data Science/001 Exp Data Analysis/Week3/exdata_data_NEI_data"
#> dir()
#[1] "Source_Classification_Code.rds" "summarySCC_PM25.rds"
# 
# load the data in 
NEI <- readRDS("./summarySCC_PM25.rds") 
SCC <- readRDS("./Source_Classification_Code.rds") 

# subset the data  
  subsetNEI  <- NEI[NEI$fips=="24510", ] 

  aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum) 

# Using the base plotting system to make a plot answering this question. 
# Set output device to png file device 
  png('plot2.png') 
  barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'), col="blue") 
# Switch off output device 
  dev.off() 
