fp = "household_power_consumption.txt"
df <- read.table(fp, header=TRUE, sep=";", dec=".", stringsAsFactors=FALSE)
df = df[df$Date == '1/2/2007' | df$Date=='2/2/2007',]
df = df[complete.cases(df),]

tmp = paste(df$Date, df$Time, sep=' ')
dt <- strptime(tmp, '%d/%m/%Y %H:%M:%S')

sm1 <- as.numeric(df$Sub_metering_1)
sm2 <- as.numeric(df$Sub_metering_2)
sm3 <- as.numeric(df$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(dt, sm1, type='l', xlab = '', ylab='Energy sub metering')
lines(dt, sm2, type='l', col='red')
lines(dt, sm3, type='l', col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
	lwd=2, col=c("black", "red", "blue"))
dev.off()