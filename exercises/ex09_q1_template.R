set.seed(1)

log_joint = function(means, change_point, y) {
  
  # Return log(0.0) if parameters are outside of the support
  if (means[[1]] < 0.1 | means[[2]] < 0.1 | means[[1]] > 0.9 | means[[2]] > 0.9 | change_point < 1 | change_point > length(y)) 
    return(-Inf)
  
  log_prior = 
    dunif(means[[1]], 0.1, 0.9, log = TRUE) + 
    dunif(means[[2]], 0.1, 0.9, log = TRUE)
  
  log_likelihood = 0.0
  for (i in 1:length(y)) {
    mean = if (i < change_point) means[[1]] else means[[2]]
    log_likelihood = log_likelihood + dbeta(y[[i]]/5, mean*5, (1-mean)*5, log = TRUE)
  }
  
  return(log_prior + log_likelihood)
}