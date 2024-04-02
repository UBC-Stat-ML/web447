forward_posterior = function(synthetic_data_size, n_mcmc_iters) {
  initial = forward(synthetic_data_size)
  
  if (n_mcmc_iters > 0) {
    samples = mcmc(initial$rates, initial$change_point, initial$data, n_mcmc_iters)
    return(samples$last_iteration_rates[[1]])
  } else {
    return(initial$rates[[1]])
  }
}

