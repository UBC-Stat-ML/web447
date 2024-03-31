set.seed(1)

log_joint = function(rates, change_point, y) {
  
  # Return log(0.0) if parameters are outside of the support
  if (rates[[1]] < 0 | rates[[2]] < 0 | change_point < 1 | change_point > length(y)) 
    return(-Inf)
  
  log_prior = 
    dexp(rates[[1]], 1/100, log = TRUE) + 
    dexp(rates[[2]], 1/100, log = TRUE)
  
  log_likelihood = 0.0
  for (i in 1:length(y)) {
    rate = if (i < change_point) rates[[1]] else rates[[2]]
    log_likelihood = log_likelihood + dpois(y[[i]], rate, log = TRUE)
  }
  
  return(log_prior + log_likelihood)
}