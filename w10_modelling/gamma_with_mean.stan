data {
  int<lower=0> n_obs;
  vector<lower=0>[n_obs] observations;
}

parameters {
  real<lower=0> shape;
  real<lower=0> rate;
}

transformed parameters {
  real rao_blackwellized_mean = shape/rate;
}

model {
  // priors
  shape ~ exponential(1.0/100);
  rate ~ exponential(1.0/100);
  
  // likelihood
  observations ~ gamma(shape, rate);
}

generated quantities {
  real monte_carlo_mean = gamma_rng(shape, rate);
}