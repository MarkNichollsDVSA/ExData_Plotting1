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


png(filename = "plot2.png")
plot(epc_data$date_time, epc_data$Global_active_powe,
     type = "n",
     xlab = "",
     ylab = "Globl Active Power (kilowatts)")

lines(epc_data$date_time, epc_data$Global_active_power)
dev.off()
