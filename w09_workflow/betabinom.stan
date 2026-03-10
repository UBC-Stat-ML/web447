data {
  int<lower=0> n_trials;
  int<lower=0> n_successes;
}
parameters {
  real<lower=0, upper=1> p;
}

model {
  p ~ uniform(0, 1);
  n_successes ~ binomial(n_trials, p);
}