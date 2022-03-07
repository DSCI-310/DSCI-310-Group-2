#‘ box plot creating funtion
#‘ 
#‘ Given a data frame and a column that we want to remain constant, 
#' this function creates a box plot for every other column vs the constant column
#’
#’ @pram  data_frame  A data frame
#’ @parm  class_col   unquoted column name of column containing class labels - variable which we want to remain constant
#’
#‘ @return  several box_plots 
#‘        The constant column (named class) is on the x axis 
#‘        All the other columns will be on the y axis in each of the box plots
#‘      
#‘ @export 
#’
#‘ @examples
#‘  attribute_box_plots(heart_disease, diagnosis)
attribute_box_plots <- function(data_frame, class_col) {
    # returns box_plots
}
