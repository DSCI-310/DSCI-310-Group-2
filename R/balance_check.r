#' Creates a table
#'
#' take a data frame and the diagnosis column and creates a table that with the percentage for the diagnosis
#' must only have numeric types
#'
#' @param df A dataframe or dataframe extension
#' @param col_n A quoted column name of the desigred column
#'
#' @return A table with three columns
#' @export
#'
#' @examples
#' diagnosis_heart_disease(heart_disease_clean, "diagnosis")
balance_check <- function(df, col_n) {
    if (!is.data.frame(df)) {
        stop("`df` should be a dataframe")
    }
    
    else if (!is.character({{col_n}})) {
        stop("`col_n` should be a quoted string")
    }
    
    else if (!({{col_n}} %in% colnames(df))) {
        stop("`col_n` should exist in the givendataframe")
    }
    
    else {
        
        num_obs <- nrow(df)
        output <- group_by(df, {{col_n}}) %>%
                     summarize(count = dplyr::n(),
                               percentage = dplyr::n() / num_obs * 100)
        output
    }
}

    