#' Cleans dataframe
#'
#' Finds all instances of missing data and converts it to NA
#' Then removes all rows with NA to create a new dataframe, this dataframe
#' must only have numeric types
#'
#' @param df A dataframe or dataframe extension
#'
#' @return A dataframe with only numeric data with no missing values
#' @export
#'
#' @examples
#' clean_data(heart_disease)
diagnosis <- function(df) {
    if (!is.data.frame(df)) {
        stop("`df` should be a dataframe")
    }
    
    df$diagnosis[df$diagnosis > 0] <- 1
    return(df)
}
                          
