# dplyr
# filter() (and slice())
# arrange()
# select() (and rename())
# distinct()
# mutate() (and transmute())
# summarise()
# sample_n() and sample_frac()

# Installing
install.packages('dplyr')
library(dplyr)

# Example Data
install.packages('nycflights13',repos = 'http://cran.us.r-project.org')
library(nycflights13)
summary(flights)
str(flights)
dim(flights)

# filter() (and slice())---------------------------------------------------
head(filter(flights,month==11,day==3,carrier=='AA'))
head(flights[flights$month == 11 & flights$day == 3 &
               flights$carrier == 'AA', ])

slice(flights, 1:10)

# arrange()
head(arrange(flights,year,month,day,air_time))
head(arrange(flights,desc(dep_delay)))

# select() (and rename())
head(select(flights,carrier))
head(rename(flights,airline_car = carrier))

# distinct()
distinct(select(flights,carrier))

# mutate() (and transmute())
head(mutate(flights, new_col = arr_delay-dep_delay))
head(transmute(flights, new_col = arr_delay-dep_delay))

# summarise()
summarise(flights,avg_air_time=mean(air_time,na.rm=TRUE))

# sample_n() and sample_frac()
sample_n(flights,10)
# .005% of the data
sample_frac(flights,0.00005) # USE replace=TRUE for bootstrap sampling
