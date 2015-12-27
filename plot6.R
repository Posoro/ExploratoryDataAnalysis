#set working directory to folder holding the data files
#> setwd("C:/Users/Administrator/Documents/01Data Science/001 Exp Data Analysis/Week3/exdata_data_NEI_data")
#Load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#First subset the motor vehicles

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)

vehiclesSCC <- SCC[vehicles,]$SCC

vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

#Next subset for motor vehicles in Baltimore,

vehiclesBaltimoreNEI <- vehiclesNEI[vehiclesNEI$fips==24510,]

vehiclesBaltimoreNEI$city <- "Baltimore City"

#Next subset for motor vehicles in Los Angeles,

vehiclesLANEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]

vehiclesLANEI$city <- "Los Angeles County"

#Merge the data for the two cities

bothNEI <- rbind(vehiclesBaltimoreNEI,vehiclesLANEI)

#plot using the ggplot2 system,

library(ggplot2)

#set print device to png file

png("plot6.png", width=840, height=480) 

#make call to ggplot and annotate graph layer by layer

  p <- ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
  
  geom_bar(aes(fill=year),stat="identity") +
  
  facet_grid(scales="free", space="free", .~city) +
  
  guides(fill=FALSE) + theme_bw() +
  
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

print(p)

#switch off print device
dev.off()  
