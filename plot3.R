#set working directory to folder holding the data files
#> setwd("C:/Users/Administrator/Documents/01Data Science/001 Exp Data Analysis/Week3/exdata_data_NEI_data")

#Load the data
NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

#subset the data to Baltimore set

baltimoreNEI <- NEI[NEI$fips=="24510",]

aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

#load ggplot2 library to plot the data

library(ggplot2)

#set output device to png print device

png("plot3.png", width=840, height=480) 

#plot the data, annotate layer by layer
p <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

#print the graph
print(p)

#switch off print device
dev.off()  
