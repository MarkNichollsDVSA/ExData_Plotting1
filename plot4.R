library(dplyr)
library(lubridate)


epc_raw <- read.table("./data/household_power_consumption.txt",
                      sep = ";",
                      header = TRUE)

epc_data <- epc_raw %>% 
  mutate(date_time = dmy_hms(paste(Date, Time))) %>%
  mutate(Date = dmy(Date)) %>%
  filter(Date == "2007-02-01" | Date == "2007-02-02") %>%
  mutate(Global_active_power = as.numeric(Global_active_power))




png(filename = "plot4.png")
par("mfcol" = c(2, 2))
#top left
plot(epc_data$date_time, epc_data$Global_active_powe,
     type = "n",
     xlab = "",
     ylab = "Globl Active Power")
lines(epc_data$date_time, epc_data$Global_active_power)

#bottom left
plot(epc_data$date_time, epc_data$Sub_metering_1,
     type = "n",
     xlab = "",
     ylab = "Energy sub metering")

lines(epc_data$date_time, epc_data$Sub_metering_1)
lines(epc_data$date_time, epc_data$Sub_metering_2, col = "red")
lines(epc_data$date_time, epc_data$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       lty = 1,
       col = c("black", "red", "blue"),
       bty = "n"
)

#top right
plot(epc_data$date_time, epc_data$Voltage, type = "n",
     xlab = "datetime",
     ylab = "Voltage")
lines(epc_data$date_time, epc_data$Voltage)

#bottom right
plot(epc_data$date_time, epc_data$Global_reactive_power, type = "n",
     xlab = "datetime",
     ylab = "Global_reactive_power")
lines(epc_data$date_time, epc_data$Global_reactive_power)



dev.off()

