# function inputs for tests
df0 <- data.frame()
    
df1 <- data.frame( 
    sex = c(factor(30), factor(40), factor(50)),
    age = c(double(0), double(1), double(0)),
    slope = c(factor(3), factor(2), factor(1)),
    diagnosis = c(factor(0), factor(0), factor(1)))

df2 <- data.frame(
    age = c(double(20), double(30)),
    diagnosis = c(factor(1), factor(1))
)


# function outputs for tests
empty_df <- table(df0$diagnosis)

num_obs <- nrow(df1)
tab1_output <- group_by(df1, "diagnosis") %>%
                                summarize(count = n(),
                                          percentage = n() / num_obs * 100)
tab1_output




num_obs <- nrow(df2)
tab2_output <- group_by(df2, "diagnosis") %>%
                                summarize(count = n(),
                                          percentage = n() / (num_obs * 100))
tab2_output





#tab2_output <- matrix(c (0, as.integer(0), as.double(0), 1, as.integer(2), as.double(100)), 
#              ncol=3, 
#              byrow=TRUE)
#colnames(tab2_output) <- c('diagnosis','count','percentage')
#tab2_output <- as.table(tab2_output)








 