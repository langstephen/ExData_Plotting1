fp = "household_power_consumption.txt"
df <- read.table(fp, header=TRUE, sep=";", dec=".", stringsAsFactors=FALSE)
df = df[df$Date == '1/2/2007' | df$Date=='2/2/2007',]
df = df[complete.cases(df),]

tmp = paste(df$Date, df$Time, sep=' ')
dt <- strptime(tmp, '%d/%m/%Y %H:%M:%S')

gap <- df$Global_active_power
gap <- as.numeric(gap)

png("plot2.png", width=480, height=480)
plot(dt, gap, type='l', xlab = '', ylab='Global Active Power (kilowatts)')
dev.off()