# download the zip file of the dataset
# unzip it to "c:\r"
# set work directory
setwd("c:/r")

# load colume name to data_name and the data on 1/2/2007 and 2/2/2007 to data
data_name <- read.table("household_power_consumption.txt",nrow=1, sep=";")
datafile <- read.table(text = grep("^[1,2]/2/2007",readLines("household_power_consumption.txt"),value=TRUE), sep = ";", na.strings = "?")
# assign colume name to datafile
colnames(datafile)<-unname(unlist(data_name[1,]))

# change data format to date and time
datafile$Date<-as.Date(datafile$Date,format="%d/%m/%Y")
datafile$D_T<-strptime(paste(datafile$Date, datafile$Time), "%Y-%m-%d %H:%M:%S")

# plot 3 --------------------------------
# device to a png file
png(filename="plot3.png", width=480, height=480, unit="px")
# plot the 3 line figures
with(datafile, plot(D_T, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l"))
with(datafile, lines(D_T, Sub_metering_2, col = "red"))
with(datafile, lines(D_T, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
# close device
dev.off()
