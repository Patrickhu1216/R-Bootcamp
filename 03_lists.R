# Create a vector
v <- c(1,2,3,4,5)

# Create a matrix
m <- matrix(1:10,nrow=2)

# Create a data frame
df <- women

# ----------------- Using ()
li <- list(v,m,df)
li <- list(sample_vec = v,sample_mat = m, sample_df = df)
li

# Selecting objects from a list
# vector
# By index
li[1] 

# By name
li['sample_vec']
li[['sample_vec']]

# Notice the type!
class(li['sample_vec'])

# Use double brackets to actually grab the items
li[['sample_vec']]

# Second set of indexing
li[['sample_vec']][1] 

for (x in li[['sample_vec']]){
  print(x)
}

li['sample_mat']
li[['sample_mat']]
li[['sample_mat']][1,]
li[['sample_mat']][1:2,1:2]
li[['sample_df']]['height']

# Combining lists-----------------------------------
double_list <- c(li,li)
double_list

str(double_list)
class(double_list)
typeof(double_list)

















