# function input for tests
two_c_df <- data.frame( 
    age = c(30, 40, 50),
    sex= c(0, 1, 0),
    diagnosis = c(0, 0, 1))

one_c_df <- dataframe(
    age = c(30, 40, 50), 
    diagnosis = c(0, 0, 1))

no_c_df <- dataframe()
data_ls <- list("age", "sex")
    

# expected function output
    
par(mfrow=c(1,2))
plot_list <- list( 
    two_c_df_output <- boxplot(age ~ diagnosis,
        data=two_c_df,
        main="Figure 1: Age vs Heart Disease Diagnosis",
        xlab="Diagnosis",
        ylab="Age",
        col="orange",
        border="brown"),
    two_c_df_output <- boxplot(sex ~ diagnosis,
        data=two_c_df,
        main="Figure 2: Sex vs Heart Disease Diagnosis",
        xlab="Diagnosis",
        ylab="sex",
        col="orange",
        border="brown"
    ))



par(mfrow=c(1,1))
plot_list <- list( 
    two_c_df_output <- boxplot(age ~ diagnosis,
        data=two_c_df,
        main="Figure 1: Age vs Heart Disease Diagnosis",
        xlab="Diagnosis",
        ylab="Age",
        col="orange",
        border="brown"
    ))


    

