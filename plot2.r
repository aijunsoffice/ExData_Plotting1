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

# plot 2 --------------------------------
# device to a png file
png(filename="plot2.png", width=480, height=480, unit="px")
# plot figure 2
with(datafile, plot(D_T,Global_active_power, xlab ="",ylab="Global Active Power(kilowatts)", type="l"))
# close device
dev.off()
