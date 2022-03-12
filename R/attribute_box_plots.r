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
attribute_box_plots<-function(data_frame, {{col_n}}) {
    plot_list <- c()
    col_names <- c(colnames(data_frame))
    if ({{col_n}}%in% col_names) {
        constant_col <- select(data_frame, col_name)
        constant_col_str <- toString(col_n)
        for i in col_names {
            col_str <- toString(i.colname)
            curr_boxplot <- boxplot(i ~ col_names,
                            data=data_frame,
                            main=append("Figure:",col_str, "vs", constant_col_str),
                            xlab= constant_col_str,
                            ylab=col_str,
                            col="orange",
                            border="brown")
            append(plot_list, curr_boxplot)     
            }
        }}
