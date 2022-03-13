library(testthat)
source("../../R/attribute_box_plots.r")
source("../../tests/testthat/helper-ATTRIBUTE_BOX_PLOTS.R")

test_that("'attribute_box_plots' should return a list with at least one box plot",{
    expect_s3_class(attribute_box_plots(three_c_df, "diagnosis"), "list")
})


test_that("'attribute_box_plots' should return a list containing box plots for every column in the given 'data_frame' vs. the given a constant column name.",{
    expect_equivalent(attribute_box_plots(three_c_df, diagnosis), three_plotlist_output) 
    expect_equivalent(attribute_box_plots(two_c_df, diagnosis), two_plotlist_output) 
    expect_equivalent(attribute_box_plots(one_c_df, diagnosis), one_plotlist_output)
})


test_that("'attribute_box_plots' should return an error when incorrect data type is passed to 'data_frame' argument", {
    expect_error(attribute_box_plots(data_ls, diagnosis))  
    expect_error(attribute_box_plots(data_ls, age)) 
})


test_that("'attribute_box_plots' should return an error when incorrect data types or unrecognizable column is passed to 'class_col' argument", {
    expect_error(attribute_box_plots(three_c_df, data_ls)) 
    expect_error(attribute_box_plots(two_c_df, slope)) 
})


test_that("'attribute_box_plots' should return an error when the given 'data_frame' is empty",{
    expect_error(attribute_box_plots(no_c_df, slope)) 
})



    