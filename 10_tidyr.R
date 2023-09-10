# Installing
install.packages('tidyr',repos = 'http://cran.us.r-project.org')
library(tidyr)

install.packages('data.table')
library(data.table)

# Using tidyr -----------------------------------------------------
# gather()
# spread()
# separate()
# unite()

# Example Data Set
comp <- c(1,1,1,2,2,2,3,3,3)
yr <- c(1998,1999,2000,1998,1999,2000,1998,1999,2000)
q1 <- runif(9, min=0, max=100)
q2 <- runif(9, min=0, max=100)
q3 <- runif(9, min=0, max=100)
q4 <- runif(9, min=0, max=100)

df <- data.frame(comp=comp,year=yr,Qtr1 = q1,Qtr2 = q2,Qtr3 = q3,Qtr4 = q4)
df

# gather() --------------------------------------------------------
# Using Pipe Operator
head(df %>% gather(Quarter,Revenue,Qtr1:Qtr4))
# With just the function
head(gather(df,Quarter,Revenue,Qtr1:Qtr4))

# spread() --------------------------------------------------------
stocks <- data.frame(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)
stocks
stocksm <- stocks %>% gather(stock, price, -time)
stocksm %>% spread(stock, price)

stocksm %>% spread(time, price)
# separate() --------------------------------------------------------
df <- data.frame(x = c(NA, "a.x", "b.y", "c.z"))
df
df %>% separate(x, c("ABC", "XYZ"))
# unite() --------------------------------------------------------
head(mtcars)
df_unite <- unite_(mtcars, "vs.am", c("vs","am"),sep = '.')
head(df_unite)

# Separate is the complement of unite
df_unite2 <- mtcars %>%
  unite(vs_am, vs, am) %>%
  separate(vs_am, c("vs", "am"))

head(df_unite2)
