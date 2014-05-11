d = read.table("household_power_consumption.txt", sep = ";",header = TRUE,
               stringsAsFactors = FALSE)

d$Date = strptime(d$Date, "%d/%m/%y%y")

t1 = as.POSIXct("2007-02-01")
t2 = as.POSIXct("2007-02-02")

d2 = d[d$Date>=t1&d$Date<=t2,]

t = paste(as.character(d2$Date), d2$Time)
t = as.POSIXct(t)

png("plot2.png", height = 480, width = 480)

plot(t, as.numeric(d2$Global_active_power), type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

