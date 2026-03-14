data {
  int<lower=0> n_obs;
  vector<lower=0>[n_obs] observations;
}

parameters {
  real<lower=0> shape;
  real<lower=0> rate;
}

model {
  // priors
  shape ~ exponential(1.0/100);
  rate ~ exponential(1.0/100);
  
  // likelihood
  observations ~ gamma(shape, rate);
}