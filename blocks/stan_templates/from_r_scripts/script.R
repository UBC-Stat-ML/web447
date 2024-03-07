setwd(getSrcDirectory(function(){})[1]) # set current dir to this script's director

fit = stan(
  "beta_binomial.stan",
  seed = 1,
  data = list(n=3, k=3),        # named list of data
  iter = 1000                   # number of samples to draw
)

print(fit)