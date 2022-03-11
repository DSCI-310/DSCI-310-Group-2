#' Cleans dataframe
#' 
#' Finds all instances of missing data and converts it to NA
#' Then removes all rows with NA to create a new dataframe, this dataframe
#' must only have museric types
#'
#' @param df A dataframe or dataframe extension
#'
#' @return A dataframe with only numeric data with no missing values
#' @export
#'
#' @examples
#' clean_data(heart_disease)
clean_data <- function(df) {
    if (!is.data.frame(df)) {
        stop("`df` should be a dataframe")
    }
    
    na_df <- dplyr::na_if(df, "?")
#    num_df <- sapply(na_df, as.numeric)
    na_df[] <- lapply(na_df, function(x) as.numeric(as.character(x)))
    clean_df <- na.omit(na_df)
#    rownames(clean_df) <- NULL
    return(clean_df)
    # if (is.null(rownames(df))) {
    #     rownames(clean_df) <- NULL
    #     return(clean_df)
    # } else {
    #     return(clean_df)
    # }
        
}