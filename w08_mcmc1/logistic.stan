data { 
  int N; 
  array[N] int y; 
}

parameters { 
  real slope;
  real intercept;
}

model {
  slope ~ normal(0, 10);
  intercept ~ normal(0, 10);
  for (i in 1:N) {
    y[i] ~ bernoulli(inv_logit(intercept + slope * i));
  }
}
