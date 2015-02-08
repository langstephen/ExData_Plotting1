fp = "household_power_consumption.txt"
df <- read.table(fp, header=TRUE, sep=";", dec=".", stringsAsFactors=FALSE)
summary(df)
df = df[df$Date == '1/2/2007' | df$Date=='2/2/2007',]
df = df[complete.cases(df),]
gap <- df$Global_active_power
gap[gap == '?'] <- NA
gap = na.omit(gap)
gap <- as.numeric(gap)

png("plot1.png", width=480, height=480)
hist(gap, main='Global Active Power', xlab='Global Active Power (kilowatts)', ylab='Frequency', c='red')
dev.off()