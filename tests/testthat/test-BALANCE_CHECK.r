library(testthat)
source("../../R/balance_check.r")
source("../../tests/testthat/helper-BALANCE_CHECK.R")

test_that("'balance_check' should return a table with the count and percentage based on the given column's data.",{
    expect_equivalent(balance_check(df1, diagnosis), tab1_output) 
    expect_equivalent(balance_check(df2, diagnosis), tab2_output) 
})

test_that("'balance_check' should return an error when incorrect data types or unrecognizable column is passed to 'class_col' argument", {
    expect_error(balance_check(df0, data_ls)) 
    expect_error(balance_check(df1, slope)) 
})


test_that("'balance_check' should return an error when the given 'data_frame' is empty",{
    expect_error(balance_check(df0, diagnosis)) 
})