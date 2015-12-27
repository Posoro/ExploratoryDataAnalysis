#set working directory
#> setwd("C:/Users/Administrator/Documents/01Data Science/001 Exp Data Analysis/Week3/exdata_data_NEI_data")
#> getwd()
# [1] "C:/Users/Administrator/Documents/01Data Science/001 Exp Data Analysis/Week3/exdata_data_NEI_data"
#> dir()
#[1] "Source_Classification_Code.rds" "summarySCC_PM25.rds"
# 
#load useful libraryies
library(ggplot2)
library(plyr)

#upload the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#First  subset the motor vehicles

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)

vehiclesSCC <- SCC[vehicles,]$SCC

vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

#Next  subset for motor vehicles in Baltimore,

baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips==24510,]

# plot using ggplot2,


#set print device to png file

png("plot5.png", width=840, height=480)

#plot the graph using ggplot2

p <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
  
  geom_bar(stat="identity",fill="grey",width=0.75) +
  
  theme_bw() +  guides(fill=FALSE) +
  
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(p)

#switch off print device
dev.off()
