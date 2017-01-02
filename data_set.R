setwd('C:/Users/Jae/Desktop/JHU - Data Science/4 _ Exploratory Data Analysis/Week4')

library(data.table)


url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'

## download the zip file
download.file(url, destfile="./project/FNEI_data.zip")

## extract the zip file
unzip(zipfile="./project/FNEI_data.zip", exdir="./project")

## read files

NEI <- readRDS("./project/summarySCC_PM25.rds")
SCC <- readRDS("./project/Source_Classification_Code.rds")

#####################################################################################################
#####################################################################################################
#####################################################################################################



