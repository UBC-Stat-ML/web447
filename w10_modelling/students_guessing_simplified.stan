data {
  int<lower=0, upper=20> score;
}

parameters {
  real<lower=0, upper=1> ability;
}

transformed parameters {
  real complete_likelihood_guessing // # <1>
    = 1.0/3 * exp(binomial_lpmf(score | 20, 0.5)); 
  real complete_likelihood_non_guessing // # <2>
    = 2.0/3 * exp(binomial_lpmf(score | 20, ability)); 
}

model {
  ability ~ uniform(0, 1); // # <3>
  target += // # <4>
    log(complete_likelihood_guessing + complete_likelihood_non_guessing); 
}

generated quantities {
  real guessing_probability = // # <5>
    complete_likelihood_guessing / (complete_likelihood_guessing + complete_likelihood_non_guessing);
}