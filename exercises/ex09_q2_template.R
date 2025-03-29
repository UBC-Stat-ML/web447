forward_posterior = function(synthetic_data_size, n_mcmc_iters) {
  initial = forward(synthetic_data_size)
  
  if (n_mcmc_iters > 0) {
    samples = mcmc(initial$means, initial$change_point, initial$data, n_mcmc_iters)
    return(samples$last_iteration_means[[1]])
  } else {
    return(initial$means[[1]])
  }
}

