data { 
  real y; 
}

parameters { 
  real<lower=0, upper=5> x;
}

model {
  x ~ uniform(0, 5); 
  y ~ uniform(0, x); 
}