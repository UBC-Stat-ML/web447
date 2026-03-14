functions { // # <1>
  real Kumaraswamy_lpdf(real x, real a, real b) { // # <2>
    return log(a) + log(b) + (a-1) * log(x) + (b-1) * log1p(-x^a);
  }
}

data {
  real<lower=0> a;
  real<lower=0> b;  
}

parameters {
  real<lower=0, upper=1> x; 
}

model {
  x ~ Kumaraswamy(a, b); // # <3>
}