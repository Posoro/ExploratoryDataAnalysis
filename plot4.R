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

# Merge the data
 
  NEISCC <- merge(NEI, SCC, by="SCC")  
 
#Load ggplot2 library
  library(ggplot2)  
  
#Exercise 4: Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?  
  
# fetch all NEIxSCC records with Short.Name (SCC) Coal  
  coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)  

# subset the data   
  subsetNEISCC <- NEISCC[coalMatches, ]  
  
  aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum) 

#set print device to png file
      
  png("plot4.png", width=640, height=480) 

#plot using ggplot2
# make initial call to ggplot2, add aesthetics

  g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))  

#add layers and annotation
#  g <- g + geom_bar(stat="identity") + 
#        xlab("year") +  
#        ylab(expression('Total PM'[2.5]*" Emissions")) +  
#        ggtitle('Total Emissions from coal sources from 1999 to 2008')  
#
  g <- g + geom_bar(stat="identity")
  g<- g + xlab("year") 
  g<- g + ylab(expression('Total PM'[2.5]*" Emissions"))
  g<- g + ggtitle('Total Emissions from coal sources from 1999 to 2008')  
      
#print graph
  print(g)  
#swicth print device off
  dev.off()
