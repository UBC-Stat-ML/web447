kernel = function(gamma, current_point, proposal_sd) {
  dim = length(current_point)
  proposal = rnorm(dim, mean = current_point, sd = proposal_sd) 
  ratio = gamma(proposal) / gamma(current_point) 
  if (runif(1) < ratio) {
    return(proposal)
  } else {
    return(current_point)
  }
}