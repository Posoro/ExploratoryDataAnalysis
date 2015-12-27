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
if(!exists("NEI")){ 
    NEI <- readRDS("./summarySCC_PM25.rds") 
  } 
if(!exists("SCC")){ 
    SCC <- readRDS("./Source_Classification_Code.rds") 
  } 
# Exercise 1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?  

   
  aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum) 
# make a base plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008. 

  png('plot1.png') 
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'),col="red") 
dev.off() 
