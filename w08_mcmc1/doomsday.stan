data { // # <1>
  real y; 
}

parameters { // # <2>
  real<lower=0, upper=5> x;
  real<lower=0, upper=1> x2;
}

model {
  x ~ uniform(0, 5); // # <3>
  y ~ uniform(0, x); // # <4>
}