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


png(filename = "plot3.png")
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
       col = c("black", "red", "blue")
)

dev.off()
