#' Cleans dataframe
#' 
#' Finds all instances of missing data and converts it to NA
#' Then removes all rows with NA to create a new dataframe
#'
#' @param df A dataframe or dataframe extension
#'
#' @return A dataframe with no missing values
#' @export
#'
#' @examples
#' clean_data(heart_disease)
clean_data <- function(df) {
    if (!is.data.frame(df)) {
        stop("`df` should be a dataframe")
    }
    
    na_df <- dplyr::na_if(df, "?")
    clean_df <- na.omit(na_df)
#    rownames(clean_df) <- NULL
    if (rownames(df) = NULL) {
        rownames(clean_df) <- NULL
        return(clean_df)
    } else {
        return(clean_df)
    }
        
}