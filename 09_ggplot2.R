# install.packages('ggplot2')
# install.packages('ggplot2movies')

library(ggplot2)
library(ggplot2movies)

df <- movies <- movies[sample(nrow(movies), 1000), ]

library(ggplot2)
df <- movies[sample(nrow(movies), 1000), ]
head(df)

# basic ------------------------------------------------------
qplot(rating,data=df,geom='histogram',binwidth=0.1,alpha=0.8)


# ggplot(data, aesthetics)
pl <- ggplot(df,aes(x=rating))

# Add Histogram Geometry
pl + geom_histogram()

# Adding Color------------------------------------------------
pl <- ggplot(df,aes(x=rating))
pl + geom_histogram(binwidth=0.1,color='red',fill='pink')

# Adding Labels-----------------------------------------------
pl <- ggplot(df,aes(x=rating))
pl + geom_histogram(binwidth=0.1,color='red',fill='pink') + 
  xlab('Movie Ratings')+ ylab('Occurences') + ggtitle(' Movie Ratings')

# Change Alpha (Transparency) ---------------------------------
pl <- ggplot(df,aes(x=rating))
pl + geom_histogram(binwidth=0.1,fill='blue',alpha=0.4) + xlab('Movie Ratings')+ ylab('Occurences')
