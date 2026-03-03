data { 
  int N; 
  vector<lower=0, upper=1>[N] y; 
}

parameters { 
  real<lower=0> concentration; 
  real slope;
  real intercept;
}

transformed parameters { // # <1>
  // linspaced_vector(N,0,1) creates a vector 
  //    of N equispace points between 0 and 1
  //    (we normalize the dates to be between zero and one)
  // functions in Stan are typically vectorized, 
  //    this is the case for example with inv_logit
  vector[N] mu = 
    inv_logit(intercept + slope*linspaced_vector(N,0,1));
}

model { // # <2>
  concentration ~ exponential(1);
  slope ~ normal(0, 1000);
  intercept ~ normal(0, 1000);
  
  // Another example of vectorization---the line below will produce the same 
  // output as the loop in the previous version, but slightly faster:
  y ~ beta_proportion(mu, concentration);
}