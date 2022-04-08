"Fits a k-nn model on the pre-processed training data from the Cleveland Heart Disease dataset (https://archive-beta.ics.uci.edu/ml/datasets/heart+disease) Saves the model as a rds file.
Usage: src/modeling.r --train=<train> --test=<test> --out_dir=<out_dir>

Options:
--train=<train>     Path (including filename) to training data (which needs to be saved as a csv file)
--test=<test>     Path (including filename) to testing data (which needs to be saved as a csv file)
--out_dir=<out_dir> Path to directory where the serialized model should be written
" -> doc

library(tidyverse)
library(tidymodels)
library(ggplot2)
library(GGally)
library(docopt)
library(rlang)
library(group2)
# source("R/accuracy_plot.r")
set.seed(4)

opt <- docopt(doc)

main <- function(train, test, out_dir) {

    # Perform Cross Validation
    training_data <- read.csv(train)
    training_data$diagnosis <- as.factor(training_data$diagnosis)
    hd_vfold <- vfold_cv(training_data, v = 5, strata = diagnosis)

   recipe <- recipe(diagnosis ~ ., data = training_data) %>%
       step_scale(all_predictors()) %>%
       step_center(all_predictors())


    # Create Classifier and Tuning
    knn_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = tune()) %>%
        set_engine("kknn") %>%
        set_mode("classification")

    k_vals <- tibble(neighbors = seq(from = 1, to = 100, by = 5))

    knn_results <- workflow() %>%
        add_recipe(recipe) %>%
        add_model(knn_spec) %>%
        tune_grid(resamples = hd_vfold, grid = k_vals) %>%
        collect_metrics()

    accuracies <- knn_results %>%
        filter(.metric == "accuracy")

    accuracy_vs_k <- accuracy_plot(accuracies)

    try({
        dir.create(out_dir, recursive = TRUE)
    })

    ggsave(paste0(out_dir, "/accuracy_plot.png"),
         accuracy_vs_k,
         width = 8,
         height = 10)


    # Prediction and Training
    knn_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = 12) %>%
        set_engine("kknn") %>%
        set_mode("classification")


    knn_fit <- workflow() %>%
        add_recipe(recipe) %>%
        add_model(knn_spec) %>%
        fit(data = training_data)


   # Load and Wrangle test data
    test_data <- read.csv(test)
    test_data$diagnosis <- as.factor(test_data$diagnosis)

    hd_predictions <- predict(knn_fit, test_data)  %>%
        bind_cols(test_data)

    hd_predictions %>%
        metrics(truth = diagnosis, estimate = .pred_class) %>%
        filter(.metric == "accuracy")


    # Assess Model Accuracy
    confusion_mat <- hd_predictions %>%
        conf_mat(truth = diagnosis, estimate = .pred_class)

    Truth <- factor(c(0, 0, 1, 1))
    Prediction <- factor(c(0, 1, 0, 1))
    Y <- c(9, 31, 27, 8)
    df <- data.frame(Truth, Prediction, Y)

    confusion_mat_plot <- ggplot(data =  df, mapping = aes(x = Truth, y = Prediction)) +
        geom_tile(aes(fill = Y), colour = "white") +
        geom_text(aes(label = sprintf("%1.0f", Y)), vjust = 1, colour="white") +
    theme_bw()

    ggsave(paste0(out_dir, "/confusion_matrix.png"),
           confusion_mat_plot,
           width = 8,
           height = 10)

}
main(opt[["--train"]], opt[["--test"]], opt[["--out_dir"]])




