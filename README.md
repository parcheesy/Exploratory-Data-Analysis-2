## Exploratory Data Analysis Course Project 2

### Description

Ths respository contains materials for submission of the second course project in the Coursera Exploratory Data Analysis course.

The goal is to examine PM25 emissions in the United States from 1999 to 2008 using a variety of plots.

### Background

Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI). You can read more information about the NEI at the EPA National Emissions Inventory web site: http://www.epa.gov/ttn/chief/eiinformation.html

For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year. 

### Raw Data

The data used in this project are the NEI records on PM2.5 for the years 1999, 2002, 2005, and 2008. They can be downloaded at: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip

The zip file contains two data sets:
1. "summarySCC_PM25.rds" - data frame with PM2.5 data organized by the following variables:
        * fips - A five-digit number (represented as a string) indicating the U.S. county
        * SCC - The name of the source as indicated by a digit string (see source code classification table)
        * Pollutant - A string indicating the pollutant
        * Emissions - Amount of PM2.5 emitted, in tons
        * type - The type of source (point, non-point, on-road, or non-road)
        * year - The year of emissions recorded
2. "Source_Classification_Code.rds" - a table providing a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific. 

### Contents of Repository

This respository contains the following:

+ plot1.R : script that exports a plot of total emissions in the U.S. from 1999-2008
+ plot1.png : a plot of total emissions in the U.S. from 1999-2008
+ plot2.R : script that exports a plot of total emissions in Baltimore City, Maryland from 1999-2008
+ plot2.png : a plot of total emissions in Baltimore City, Maryland from 1999-2008 
+ plot3.R : script that exports plots of total emissions in Baltimore organized by type of source from 1999-2008  
+ plot3.png : a plot of total emissions in Baltimore organized by type of source from 1999-2008 
+ plot4.R : script that exports a plot of total emissions from coal combustion-related sources in the U.S. from 1999-2008
+ plot4.png : a plot of total emissions from coal combustion-related sources in the U.S. from 1999-2008 
+ plot5.R : script that exports a plot of motor vehicle emissions in Baltimore from 1999-2008 
+ plot5.png : a plot of motor vehicle emissions in Baltimore from 1999-2008
+ plot6.R : script that exports a plot comparing motor vehicle emissions from 1999-2008 in Baltimore and Los Angeles County
+ plot6.png : a plot comparing motor vehicle emissions from 1999-2008 in Baltimore and Los Angeles County

## Important Notes About Script
Each script contains code that reads the NEI data sets into memory. This takes a minute and is the cause of delays when running each script.

In order for each script to properly access the raw data it should share a directory with the raw data files "summarySCC_PM25.rds" and "Source_Classification_Code.rds". Otherwise the scripts may be altered to set the working directory to the location of these data sets. 

## Description of Scripts
Each script performs the following two steps:

1. Reads the NEI data sets into memory.

2. Exports a plot or plots to the PNG file corresponding to the script name.
