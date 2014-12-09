############################################################

##FILE: "plot1.R"
##TITLE: "Coursera Exploratory Data Analysis Course Project 2"

##DESCRIPTION:
## 1. Import United States PM25 data
## 2. Find total emissions by year
## 3. Export plot of total emissions by year to "plot1.png"

############################################################

# Import dplyr package for subsetting and working with data
library(dplyr)

### 1. Import United States PM25 data
NEI <- readRDS("summarySCC_PM25.rds")

### 2. Find total emissions by year
NEI <- group_by(NEI, year)
NEI_sums <- summarise(NEI, sum(Emissions))
colnames(NEI_sums) <- c("year", "emissions")

### 3. Plot total emissions by year and export to "plot1.png"
png("plot1.png")
plot(NEI_sums, xlab="Year", ylab="Total Emissions (tons)", xaxt="n", yaxt="n", pch=19)
axis(1, at=c(1999, 2002, 2005, 2008))
axis(2, at= x<-seq(3000000, 8000000, 1000000), labels=format(x, scientific=FALSE))
title(main=expression("U.S.  " * "PM"[2.5] * "  Emissions"))
dev.off()
