############################################################

##FILE: "plot5.R"
##TITLE: "Coursera Exploratory Data Analysis Course Project 2"

##DESCRIPTION:
## 1. Import United States PM25 data and Classification Code Table
## 2. Extract SCC numbers related to motor vehicle sources from Classification Code Table
## 3. Find total emissions by motor vehicle sources by year in Baltimore City, Maryland
## 4. Export plot of motor vehicle sources over time in Baltimore to "plot5.png"

############################################################

# Import dplyr package for subsetting and working with data
library(dplyr)
library(ggplot2)

### 1. Import United States PM25 data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## 2. Extract SCC numbers related to motor vehicle sources from Classification Code Table
lvls <- levels(SCC$EI.Sector)
auto_sources <- filter(SCC, EI.Sector==lvls[49] | EI.Sector==lvls[50] | EI.Sector==lvls[51] | EI.Sector==lvls[52])$SCC
NEI <- NEI[NEI$SCC %in% auto_sources, ]

## 3. Find total emissions by coal combustion related sources by year in Baltimore City, Maryland
NEI <- group_by(NEI, year)
NEI <- filter(NEI, fips=="24510")
NEI_sums <- summarise(NEI, sum(Emissions))
colnames(NEI_sums) <- c("year", "emissions")

## 4. Export plot of coal emissions over time in Baltimore to "plot5.png"
png("plot5.png")
plot(NEI_sums, main="Motor Vehicle Source Emissions in Baltimore City, Maryland", xaxt="n",  pch=19, xlab="Year", ylab="Motor Vehicle Emissions (tons)")
axis(1, at=c(1999, 2002, 2005, 2008))
dev.off()
