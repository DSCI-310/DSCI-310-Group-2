# function inputs for tests
empty <- data.frame(matrix(ncol = 3, nrow = 0))
two_cols_1_qmissing <- data.frame(col1 = c(2, 5, "?"),
                                col2 = c(3,6,4))
two_cols_2_qmissing <- data.frame(col1 = c(2, 5, "?"),
                                col2 = c(3,"?",4))
two_cols_2_qmissing_and_na <- data.frame(col1 = c(2, 5, "?"),
                                col2 = c(NA,"?",5))
two_cols_2_na <- data.frame(col1 = c(2, 5, 7),
                                col2 = c(3,8,NA))
vec <- 1:3
test_list <- list(2,3,4)




# function outputs for tests
two_cols_1_qmissing_output <- data.frame(col1 = c(2, 5),
                                col2 = c(3,6))
two_cols_2_qmissing_output <- data.frame(col1 = c(2),
                                col2 = c(3))
two_cols_2_qmissing_and_na_output <- data.frame(matrix(ncol = 2, nrow = 0))
two_cols_2_na_output <- data.frame(col1 = c(2, 5),
                                col2 = c(3,8))