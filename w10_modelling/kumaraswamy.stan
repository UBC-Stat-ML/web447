data {
  real<lower=0> a;
  real<lower=0> b;  
}

parameters {
  real<lower=0, upper=1> x; // # <1>
}

model {
  target += log(a) + log(b) + (a-1) * log(x) + (b-1) * log1p(-x^a); // # <2>
                                                    // ^ log1p(z) = log(1+z)
}