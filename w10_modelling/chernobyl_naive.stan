data {
  int<lower=0> n_above_limit; // # <1>
  int<lower=0> n_below_limit; // # <2>
  real<lower=0> limit;
  vector<upper=limit>[n_below_limit] data_below_limit; // # <3>
  
}

parameters {
  real<lower=0> rate; 
  vector<lower=limit>[n_above_limit] data_above_limit; // # <4>
}

model {
  // prior
  rate ~ exponential(1.0/100);
  
  // likelihood
  data_above_limit ~ exponential(rate);
  data_below_limit ~ exponential(rate); 
}

generated quantities {
  real mean = 1.0/rate;
}