# Timestamps -----------------------------------------
today <- Sys.Date()
today

# YYYY-MM-DD
as.Date('1990-11-03')

# Using Format
as.Date("Nov-03-90",format="%b-%d-%y")

# Using Format
as.Date("November-03-1990",format="%B-%d-%Y")

dates <- c("05/27/84", "07/07/05")
betterDates <- as.Date(dates,
                       format = "%m/%d/%y")
betterDates 

dates <- c("May 27 1984", "July 7 2005")
betterDates <- as.Date(dates,
                       format = "%B %d %Y")


as.POSIXct("11:02:03",format="%H:%M:%S")
#as.POSIXct("November-03-1990 11:02:03",format="%B-%d-%Y %H:%M:%S")

strptime("11:02:03",format="%H:%M:%S")
