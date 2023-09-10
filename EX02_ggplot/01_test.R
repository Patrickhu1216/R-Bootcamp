getwd()
setwd("C:/Users/user/Documents/R_A_Z/S6_GGPLOT")
getwd()

movies <- read.csv("P2-Movie-Ratings.csv")
head(movies)

typeof(movies)
class(movies)
colnames(movies) <- c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")
head(movies)
tail(movies)
str(movies)

movies$Genre <- as.factor(movies$Genre)
str(movies)

summary(movies)

movies$Year <- factor(movies$Year)

#----------------------- Aesthetics
library(ggplot2)

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

# add geometry
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) + 
    geom_point()

# add colour
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
       colour=Genre, size=BudgetMillions)) + 
  geom_point()
# -----------------------------Plotting with Layers

p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                             colour=Genre, size=BudgetMillions))
# point
p + geom_point()

# lines
p + geom_line()

# multiple layers
p + geom_point() + geom_line()
p+ geom_line() + geom_point() 

# -----------------------------Overriding Aesthetics
q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                             colour=Genre, size=BudgetMillions))

# add geom layer()
q + geom_point()

#overriding
#ex1
q + geom_point(aes(size=CriticRating))

#ex2
q + geom_point(aes(colour=BudgetMillions)) 

q + geom_point()

#ex3
q + geom_point(aes(x=BudgetMillions)) + xlab("BudgetMillions $$")

#ex4 reduce line size
p+ geom_line(size=1) + geom_point() 

# ------------------------- Mapping vs Setting
r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

# Add colour
# 1 Mapping
r + geom_point(aes(colour=Genre))
# 2 Setting
r + geom_point(colour="DarkGreen")
# ERROR
r + geom_point(aes(colour="DarkGreen"))

# 1 Mapping
r + geom_point(aes(size=BudgetMillions))
# 2 Setting
r + geom_point(size=10)

# ------------------------ Histgram
s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth=10)

# add colour
s + geom_histogram(binwidth=10, aes(fill=Genre))

# add a border
s + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

# density charts
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position="stack")


#----------Starting Layer Tips
t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth=10,
                   fill="White", colour="Blue")

# another way
t <- ggplot(data=movies)
t + geom_histogram(binwidth=10, aes(x=AudienceRating),
                   fill="White", colour="Blue")

t <- ggplot(data=movies)
t + geom_histogram(binwidth=10, 
                   aes(x=CriticRating),
                   fill="White", colour="Blue")

#------------------- Statistical Transformation

?geom_smooth

u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))
u + geom_point() + geom_smooth(fill=NA)
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating,
                             colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2) + geom_point()

u + geom_boxplot(size=1.2) + geom_jitter()
# another way:
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5) 

#----------------------------------facets
v <- ggplot(data=movies, aes(x=BudgetMillions))

v + geom_histogram(binwidth=10, aes(fill=Genre), 
                   colour="Black") + 
  facet_grid(Genre~., scales="free")

# scatterplates:
w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))
w + geom_point(size=3) 

w + geom_point(size=3)  +
  facet_grid(Genre~.)

w + geom_point(size=3)  +
  facet_grid(.~Year)

w + geom_point(size=3) +
  geom_smooth(fill=NA) +
  facet_grid(Genre~Year)












