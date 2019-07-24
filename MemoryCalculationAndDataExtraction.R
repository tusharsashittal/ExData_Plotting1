library(dplyr)
library(lubridate)

initial <- read.table("../JHUCourse4Week1/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, nrows = 100)
rows100Size <- object.size(initial)
res <- system('powershell -command "Get-content ../JHUCourse4Week1/household_power_consumption.txt | Measure-Object -Line"', intern=TRUE)
totalNumRowsInFile <- as.numeric(res[4])
tabSize <- rows100Size * (totalNumRowsInFile / 100)

#Based on the above estimation, the size of the table in R (i.e. in memory) will be 322.91 MB. My laptop definately has several times more free memory and therefore there will be no issues in importing this table into R.
classes <- sapply(initial, class)
tabAll <- read.table("../JHUCourse4Week1/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = classes)
tabAllDF <- tbl_df(tabAll)
tabAllDF <- mutate(tabAllDF, Date1 = as.Date.character(Date, "%d/%m/%Y"), DateTime = dmy_hms(paste0(Date, Time))) %>% 
            filter(Date1 == ymd("2007-02-01") | Date1 == ymd("2007-02-02"))










