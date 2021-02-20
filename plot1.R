library(dplyr)
library(lubridate)


epc_raw <- read.table("./data/household_power_consumption.txt",
                       sep = ";",
                       header = TRUE)

epc_data <- epc_raw %>% 
  mutate(Date = dmy(Date)) %>%
  mutate(Global_active_power = as.numeric(Global_active_power)) %>%
  filter(Date == "2007-02-01" | Date == "2007-02-02")



png(filename = "plot1.png")
hist(epc_data$Global_active_power, 
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Popwer")
dev.off()

