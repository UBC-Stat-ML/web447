data {
  int<lower=0> n_above_limit;
  int<lower=0> n_below_limit;
  real<lower=0> limit;
  vector<upper=limit>[n_below_limit] data_below_limit;
}

parameters {
  real<lower=0> rate; // # <1>
}

model {
  // prior
  rate ~ exponential(1.0/100);
  
  // likelihood
  target += n_above_limit * exponential_lccdf(limit | rate); // # <2>
  data_below_limit ~ exponential(rate); 
}

generated quantities {
  real mean = 1.0/rate;
}