d = read.table("household_power_consumption.txt", sep = ";",header = TRUE,
               stringsAsFactors = FALSE)

d$Date = strptime(d$Date, "%d/%m/%y%y")

t1 = as.POSIXct("2007-02-01")
t2 = as.POSIXct("2007-02-02")

d2 = d[d$Date>=t1&d$Date<=t2,]

t = paste(as.character(d2$Date), d2$Time)
t = as.POSIXct(t)

png("plot4.png", height = 480, width = 480)

par("mfcol" = c(2,2))

plot(t, as.numeric(d2$Global_active_power), type = "l", 
     ylab = "Global Active Power", xlab = "")

plot(t, as.numeric(d2$Sub_metering_1), type = "l", col = "black", 
     ylim = c(0,38), ylab = "", xlab = " ",
     xaxt = "n", yaxt = "n")
par(new = TRUE)
plot(t, as.numeric(d2$Sub_metering_2), type = "l",col = "red", 
     ylim = c(0,38), ylab = "", xlab = " ",
     xaxt = "n", yaxt = "n")
par(new = TRUE)
plot(t, as.numeric(d2$Sub_metering_3), type = "l", col = "blue", 
     ylim = c(0,38),
     ylab = "Energy sub metering", xlab = "")

legend('topright', c( "Sub_metering_1","Sub_metering_2", "Sub_metering_2"), 
       col= c("black","red","blue"), lty=1, cex = 0.8, bty="n")

plot(t, as.numeric(d2$Voltage), type = "l", 
     ylab = "Voltage", xlab = "datetime")

plot(t, as.numeric(d2$Global_reactive_power), type = "l", 
     ylab = "Global_reactive_power", xlab = "datetime")

par("mfcol" = c(1,1))

dev.off()