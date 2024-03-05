plot_traces_and_hist = function(samples) {
  layout_mat <- matrix(c(1, 2), nrow = 1, ncol = 2,
                       byrow = TRUE)
  layout(mat = layout_mat, 
         heights = c(1),
         widths = c(3, 1), respect =TRUE)
  
  
  par(mar = c(2,2,0,0))
  plot(samples, axes = TRUE, type = "o", col = rgb(red = 0, green = 0, blue = 0, alpha = 0.2))
  xhist <- hist(samples, plot = FALSE)
  barplot(xhist$counts, axes = TRUE, space = 0, horiz=TRUE)
  return(NULL)
}