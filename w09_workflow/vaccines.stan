data {
  int n;
  int n_trials;
  array[n] int<lower=1,upper=n_trials> trials;
  array[n] int arms;
  int n_arms;
  array[n] int groupSizes;
  array[n] int numbersOfCases;
  array[n] int is_vaccinated;
}

parameters {
  vector<lower=0,upper=1>[n_trials] efficiencies;
  vector<lower=0,upper=1>[n_trials] prevalences;
}

model {

  for (trial in 1:n_trials) {
    efficiencies[trial] ~ beta(1, 1);
    prevalences[trial] ~ beta(1, 1);
  }

  for (i in 1:n) {
    numbersOfCases[i] ~ binomial(groupSizes[i], prevalences[trials[i]] * (is_vaccinated[i] == 1 ? 1.0 - efficiencies[trials[i]] : 1.0));
  }
}