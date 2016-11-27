# download the zip file of the dataset
# unzip it to "c:\r"
# set work directory
setwd("c:/r")

# load colume name to data_name and the data on 1/2/2007 and 2/2/2007 to data
data_name <- read.table("household_power_consumption.txt",nrow=1, sep=";")
datafile <- read.table(text = grep("^[1,2]/2/2007",readLines("household_power_consumption.txt"),value=TRUE), sep = ";", na.strings = "?")
# assign colume name to datafile
colnames(datafile)<-unname(unlist(data_name[1,]))

# plot 1 --------------------------------
# device to png file
png(filename="plot1.png", width=480, height=480, unit="px")
# plot figure 1
hist(datafile$Global_active_power, xlab = "Global Active Power(kilowatts)", main = "Global Active Power", col = "red")
# close device
dev.off()
