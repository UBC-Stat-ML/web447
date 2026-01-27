coin_flips = rep(0, 4) # "dataset" of four identical coin flips = (0, 0, 0, 0) 

# simPPLe's description of our "bag of coins" example
my_first_probabilistic_program = function() {
  
  # Similar to forward sampling, but use 'observe' when the variable is observed
  coin_index = simulate(DiscreteDistribution(supp = 0:2))
  prob_heads = coin_index/2
  for (i in seq_along(coin_flips)) { 
    observe(coin_flips[i], Bern(prob_heads)) 
  }
  
  # return the test function g(x, y)
  return(ifelse(coin_index == 1, 1, 0))
}