############################################################

##FILE: "plot6.R"
##TITLE: "Coursera Exploratory Data Analysis Course Project 2"

##DESCRIPTION:
## 1. Import United States PM25 data and Classification Code Table
## 2. Extract SCC numbers related to motor vehicle sources from Classification Code Table
## 3. Find total emissions by motor vehicle sources by year in Baltimore City, Maryland and Los Angeles County, California
## 4. Export plot of motor vehicle sources over time by city in Baltimore and Los Angeles to "plot6.png"

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

## 3. Find total emissions by motor vehicle sources by year in Baltimore City, Maryland and Los Angeles County, California
NEI <- group_by(NEI, year, fips)
NEI <- filter(NEI, fips=="24510" | fips=="06037")
NEI_sums <- summarise(NEI, sum(Emissions))
colnames(NEI_sums) <- c("year", "fips", "emissions")
NEI_sums <- mutate(NEI_sums, fips=factor(fips, labels=c("Los Angeles", "Baltimore")))

## 4. Export plot of motor vehicle sources over time by city in Baltimore and Los Angeles to "plot6.png"
png("plot6.png")
p <- ggplot(NEI_sums, aes(year, emissions))
p <- p + geom_point(aes(color = fips)) + xlab("Year") + ylab("Motor Vehicle Emissions (tons)") + labs(title="Motor Vehicle Source Emissions by City") + geom_smooth(aes(color = fips), method="lm", se=FALSE)
print(p)
dev.off()
