#' Creates a table
#'
#' take a data frame and the diagnosis column and creates a table that with the percentage for the diagnosis
#' must only have numeric types
#'
#' @param df A dataframe or dataframe extension
#' @param col_n An unquoted column name of the desigred column
#'
#' @return A table with three columns
#' @export
#'
#' @examples
#' diagnosis_heart_disease(heart_disease_clean, diagnosis)
balance_check <- function(df, col_n) {
    if (!is.data.frame(df)) {
        stop("`df` should be a dataframe")
    }
    
    else if (!is.character(col_n)) {
        stop("`col_b` should be an unquoted string")
    }
    
    else {
        num_obs <- nrow(df)
        group_by(df, {{col_n}}) %>%
            summarize (count = n(),
                       percentage = n() / num_obs * 100)
    }
}

    