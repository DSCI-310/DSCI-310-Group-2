# function inputs for tests
df0 <- data.frame()
    
df1 <- data.frame( 
    sex = c(30, 40, 50),
    age = c(0, 1, 0),
    slope = c(3, 2, 1),
    diagnosis = c(0, 0, 1))

df2 <- data.frame(
    age = c(20, 30),
    diagnosis = c(1, 1)
)


# function outputs for tests
empty_df <- table(df0$diagnosis)

tab1 <- table(df1$diagnosis)

tab <- as.table(tab1)
 