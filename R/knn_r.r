#' Knn results function with recipe and knn spec input and knn fit with same inputs
#'    
#' @param recipe an object of type recipe which deescribes the steps that should be applied to a data set in order to get it ready for data analysis
#'
#' @param knn_spec k-nearest-neighbour specification, defines the type of model is being fit
#' 
#' @return a tibble with 7 columns of the summarised result
#'       - neightbors, metric, estimator, mean, n, std_err, config
#' 
#' @examples
#' knn_results(recipe, knn_spec)
knn_results <- function(recipe, knn_spec) {
    # returns a tibble with 7 columns
}