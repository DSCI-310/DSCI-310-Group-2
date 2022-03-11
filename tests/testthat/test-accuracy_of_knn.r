library(testthat)
library(tidyverse)

source("././tests/testthat/helper-accuracy_of_knn.r")
source("././R/accuracy_plot.r")

test_that("`accuracy_plot` should return a ggplot", {
    expect_s3_class(accuracy_plot(empty_tibble), "ggplot")
    expect_s3_class(accuracy_plot(tibble_2_row), "ggplot")
    expect_s3_class(accuracy_plot(tibble_5_row), "ggplot")
})

test_that("`accuracy_plot` should return a ggplot and uses correct data", {
    plot1 <- accuracy_plot(tibble_2_row)
    plot2 <- accuracy_plot(tibble_5_row)
    expect_that(tibble_2_row, equals(plot1$data))
    expect_that(tibble_5_row, equals(plot2$data))
})

test_that("`accuracy_plot` should return a ggplot with x and y axis properly labeled", {
    plot <- accuracy_plot(tibble_2_row)
    expect_equivalent(plot$labels$x, "Neighbors")
    expect_equivalent(plot$labels$y, "Accuracy Estimate")
})

test_that("`accuracy_plot` should return a ggplot and plot layers match expectations", {
    plot <- accuracy_plot(tibble_2_row)
    expect_equivalent(class(plot$layers[[1]]$stat), "point")
    expect_equivalent(class(plot$layers[[2]]$stat), "line")
    expect_equivalent(plot, accuracy_tibble_2_row)
    expect_equivalent(accuracy_plot(tibble_5_row), accuracy_tibble_5_row)
})


test_that("`accuracy_plot` should throw an error when incorrect types are passed to `tibble` argument", {
    expect_error(accuracy_plot(0))
    expect_error(accuracy_plot("abc"))
})