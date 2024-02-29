data { 
  int N; # <1>
  vector<lower=0, upper=1>[N] y;
}
transformed data {
  vector[N] date_range = linspaced_vector(N,0,1);
}
parameters { # <2>
  real<lower=0> concentration;
  real slope;
  real intercept;
}
transformed parameters {
  vector[N] mu = inv_logit(intercept + slope*date_range);
}
model {
  concentration ~ exponential(0.001);
  slope ~ std_normal();
  intercept ~ std_normal();
  y ~ beta_proportion(mu, concentration);
}
