############################################################

##FILE: "plot3.R"
##TITLE: "Coursera Exploratory Data Analysis Course Project 2"

##DESCRIPTION:
## 1. Import United States PM25 data
## 2. Find total emissions by year and type in Baltimore City, Maryland
## 3. Export plot of total emissions by type over time to "plot3.png"

############################################################

# Import dplyr package for subsetting and working with data
library(dplyr)
library(ggplot2)

### 1. Import United States PM25 data
NEI <- readRDS("summarySCC_PM25.rds")

### 2. Find total emissions by year and type in Baltimore City, Maryland
NEI <- group_by(NEI, year, type)
NEI <- filter(NEI, fips=="24510")
NEI_sums <- summarise(NEI, sum(Emissions))
colnames(NEI_sums) <- c("year", "type", "emissions")

### 3. Plot total emissions by type over time in Baltimore and export to "plot3.png"
png("plot3.png")
p <- ggplot(NEI_sums, aes(year, emissions))
p <- p + geom_point() + facet_grid(. ~ type) + theme(axis.text.x = element_text(angle=45)) + xlab("Years") + ylab("Emissions (tons)") + labs(title=expression("PM"[2.5] * "  Emissions By Type Over Time"))
print(p)
dev.off()
