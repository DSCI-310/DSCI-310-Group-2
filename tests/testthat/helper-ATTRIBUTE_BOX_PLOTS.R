# function input for tests
three_c_df <- data.frame( 
    age = c(30, 40, 50),
    sex = c(0, 1, 0),
    slope = c(3, 2, 1),
    diagnosis = c(0, 0, 1))

two_c_df <- data.frame( 
    age = c(30, 40, 50),
    sex = c(0, 1, 0),
    diagnosis = c(0, 0, 1))

one_c_df <- data.frame(
    age = c(30, 40, 50), 
    diagnosis = c(0, 0, 1))

no_c_df <- data.frame()
data_ls <- list("age", "sex")
    

# expected function output
    
par(mfrow=c(1,3))
three_plotlist_output <- list( 
    three_c_f_df_output <- boxplot(age ~ diagnosis,
        data=three_c_df,
        main="Figure: Age vs Heart Disease Diagnosis",
        xlab="Diagnosis",
        ylab="Age",
        col="orange",
        border="brown"),
    three_c_s_df_output <- boxplot(sex ~ diagnosis,
        data=three_c_df,
        main="Figure: Sex vs Heart Disease Diagnosis",
        xlab="Diagnosis",
        ylab="Sex",
        col="orange",
        border="brown"),
    three_c_t_df_output <- boxplot(slope ~ diagnosis,
        data=three_c_df,
        main="Figure: slope vs Heart Disease Diagnosis",
        xlab="Diagnosis",
        ylab="Slope",
        col="orange",
        border="brown")
    )




par(mfrow=c(1,2))
two_plotlist_output <- list( 
    two_c_df_f_output <- boxplot(age ~ diagnosis,
        data=two_c_df,
        main="Figure: Age vs Heart Disease Diagnosis",
        xlab="Diagnosis",
        ylab="Age",
        col="orange",
        border="brown"),
    two_c_df_s_output <- boxplot(sex ~ diagnosis,
        data=two_c_df,
        main="Figure: Sex vs Heart Disease Diagnosis",
        xlab="Diagnosis",
        ylab="Sex",
        col="orange",
        border="brown"
    ))



par(mfrow=c(1,1))
one_plotlist_output <- list( 
    one_c_df_output <- boxplot(age ~ diagnosis,
        data=two_c_df,
        main="Figure 1: Age vs Heart Disease Diagnosis",
        xlab="Diagnosis",
        ylab="Age",
        col="orange",
        border="brown"
    ))


    

