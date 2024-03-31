forward_posterior = function(synthetic_data_size, n_mcmc_iters) {
  initial = forward(synthetic_data_size)
  
  if (n_mcmc_iters > 0) {
    samples = mcmc(initial$rates, initial$change_point, initial$data, n_mcmc_iters)
    return(sum(samples$last_iteration_rates))
  } else {
    return(sum(initial$rates))
  }
}

