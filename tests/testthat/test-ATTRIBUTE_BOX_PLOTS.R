library(testthat)
source ("../R/attribute_box_plots.r")

test_that("'attribute_box_plots' should return a list with at least one box plot",{
    #tests to be added
})


test_that("'attribute_box_plots' should return a list containing box plots for every column in the given 'data_frame' vs. the given a constant column name. The total number of box plots should be the number of columns - 1",{
    expect_equivalent(attribute_box_plots(three_c_df, diagnosis), three_plotlist_output) 
    expect_equivalent(attribute_box_plots(two_c_df, diagnosis), two_plotlist_output) 
    expect_equivalent(attribute_box_plots(one_c_df, diagnosis), one_plotlist_output)
})


test_that("'attribute_box_plots' should return an error when incorrect data type is passed to 'data_frame' argument", {
    #tests to be added
})


test_that("'attribute_box_plots' should return an error when incorrect data types is passed to 'class_col' argument", {
    #tests to be added
})


test_that("'attribute_box_plots' should return an error when the given 'data_frame' is empty",{
    #tests to be added
})



    