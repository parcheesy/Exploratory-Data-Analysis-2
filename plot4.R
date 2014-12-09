############################################################

##FILE: "plot4.R"
##TITLE: "Coursera Exploratory Data Analysis Course Project 2"

##DESCRIPTION:
## 1. Import United States PM25 data and Classification Code Table
## 2. Extract SCC numbers related to coal combustion related sources from Classification Code Table
## 3. Find total emissions by coal combustion related sources by year
## 4. Export plot of coal emissions over time to "plot4.png"

############################################################

# Import dplyr package for subsetting and working with data
library(dplyr)
library(ggplot2)

### 1. Import United States PM25 data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## 2. Extract SCC numbers related to coal combustion related sources from Classification Code Table
lvls <- levels(SCC$EI.Sector)
coal_sources <- filter(SCC, EI.Sector==lvls[13] | EI.Sector==lvls[18] | EI.Sector==lvls[23])$SCC
NEI <- NEI[NEI$SCC %in% coal_sources, ]

## 3. Find total emissions by coal combustion related sources by year
NEI <- group_by(NEI, year)
NEI_sums <- summarise(NEI, sum(Emissions))
colnames(NEI_sums) <- c("year", "emissions")

## 4. Export plot of coal emissions over time to "plot4.png"
png("plot4.png")
plot(NEI_sums, main="Coal Combustion-Related Source Emissions in U.S.", xaxt="n", yaxt="n", pch=19, xlab="Year", ylab="Coal Emissions (tons)")
axis(1, at=c(1999, 2002, 2005, 2008))
axis(2, at= x <- seq(300000, 600000, 100000), labels= format(x, big.mark=",", scientific=FALSE))
dev.off()
