data {
  int<lower=0> N; // number of observations
  vector[N] xs;   // independent variable
  vector[N] ys;   // dependent variable
}

parameters {
  real slope;
  real<lower=0> sigma;
}

model {
  // prior
  slope     ~ student_t(3, 0, 100);
  sigma     ~ exponential(0.001);

  // likelihood
  ys ~ normal(slope*xs, sigma);
}

generated quantities {
  real prediction = normal_rng(slope*1.5, sigma);
}