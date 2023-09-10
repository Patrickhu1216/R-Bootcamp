# Creating a Matrix---------------------------
v <- 1:10
v
matrix(v)
matrix(v,nrow=2)
matrix(1:12,byrow = FALSE,nrow=4)
matrix(1:12, byrow=TRUE, nrow=4)

# Creating Matrices from Vectors
goog <- c(450,451,452,445,468)
msft <- c(230,231,232,236,228)
stocks <- c(goog,msft)
stock.matrix <- matrix(stocks,byrow=TRUE,nrow=2)
stock.matrix

# Naming Matrices
days <- c('Mon','Tue','Wed','Thu','Fri')
st.names <- c('GOOG','MSFT')
colnames(stock.matrix) <- days
rownames(stock.matrix) <- st.names
stock.matrix

# Matrix Operations--------------------------------
colSums(stock.matrix)
rowSums(stock.matrix)
rowMeans(stock.matrix)

# Binding columns and rows
FB <- c(111,112,113,120,145)
tech.stocks <- rbind(stock.matrix,FB)
tech.stocks
avg <- rowMeans(tech.stocks)
avg
tech.stocks <- cbind(tech.stocks,avg)
tech.stocks

# Matrix Arithmetic-------------------------------
mat <- matrix(1:50,byrow=TRUE,nrow=5)
mat

# Multiplication
2*mat

# Division (reciprocal)
1/mat

# Power
mat ^ 2

# Matrix Arithmetic with multiple matrices
mat / mat
mat*mat
#mat^mat

# Matrix multiplication
mat2 <- matrix(1:9, nrow=3)
mat2
# True Matrix Multiplication
mat2 %*% mat2

# Matrix Selection and Indexing--------------------
mat <- matrix(1:50,byrow=TRUE,nrow=5)
mat

# Grab first row
mat[1,]

#Grab first column
mat[,1]

# Grab a center square of:
mat[2:3,5:6]

# Factor and Categorical Matrices------------------
animal <- c('d','c','d','c','c')
id <- c(1,2,3,4,5)

factor.ani <- factor(animal)
factor.ani

ord.cat <- c('cold','med','hot')

temps <- c('cold','med','cold','med','hot','hot','cold')
fact.temp <- factor(temps,ordered=TRUE,levels=c('cold','med','hot'))
fact.temp

fact.temp2 <- factor(temps,ordered=FALSE,levels=ord.cat)
fact.temp2

summary(temps)
summary(fact.temp)



























