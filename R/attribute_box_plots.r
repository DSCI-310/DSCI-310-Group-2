#‘ box plot creating funtion
#‘ 
#‘ Given a data frame and a column that we want to remain constant, 
#' this function creates a box plot for every other column vs the constant column
#’
#’ @pram  data_frame  A data frame
#’ @parm  class_col   unquoted column name of column - variable which we want to remain constant
#’
#‘ @return  a list of box_plots 
#‘        The constant column for all the boxplots
#‘        All the other columns will be on the y axis in each of the box plots
#‘      
#‘ @export 
#’
#‘ @examples
#‘  attribute_box_plots(heart_disease, diagnosis)
attribute_box_plots <- function(data_frame, col_n) {
    if (!is.data.frame(data_frame)) {
        stop("`data_frame` should be a data frame or data frame extension (e.g. a tibble)")
    }
    
    else if (!is.character(col_n)) {
        stop("`col_b` should be an unquoted string")
    }
    
    else if (dim(data_frame)[1] == 0) {
        stop("`data_frame` should not be empty")
    }
    
    plot_list <- c()
    col_names <- c(colnames(data_frame))
    if (col_n %in% col_names) {
        constant_col <- dplyr::select(data_frame, col_n)
        constant_col_str <- toString(col_n)
        for (i in col_names) {
            col_str <- toString(i)
            curr_boxplot <- boxplot(i ~ col_n,
                            data=data_frame,
                            main=append("Figure:",col_str, "vs", constant_col_str),
                            xlab= constant_col_str,
                            ylab=col_str,
                            col="orange",
                            border="brown")
            append(plot_list, curr_boxplot)     
        }
        print(plot_list)
    } else {
        stop("`col_n` should exist in the given data frame.")
    }
    
}
