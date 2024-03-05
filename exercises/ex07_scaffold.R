# prior: Beta(alpha, beta)
alpha = 1
beta = 2 

# observations: binomial draws
n_successes = 3 
n_trials = 3

gamma_beta_binomial = function(p) {
  if (p < 0 || p > 1) return(0.0)
  dbeta(p, alpha, beta) * dbinom(x = n_successes, size = n_trials, prob = p)
}