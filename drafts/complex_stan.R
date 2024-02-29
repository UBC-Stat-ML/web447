suppressPackageStartupMessages(require(rstan))
suppressPackageStartupMessages(require(ggplot2))
suppressPackageStartupMessages(require(dplyr))

# data from: https://data.chhs.ca.gov/dataset/covid-19-variant-data
df = read.csv("../quizzes/q1/covid19_variants.csv")
df$date = as.Date(df$date,format="%Y-%m-%d")

init_fun <- function() {
  list(concentration = 10, slope = 10, intercept=10)
}
fit = stan(
  "drafts/complex.stan",
  data = list(y = pmax(pmin(df$percentage/100,0.999),0.001), N = length(df$percentage))
)
plot(fit, pars=c("intercept", "slope", "concentration"), show_density=TRUE)
reg_pars = extract(fit, pars=c("intercept", "slope"))
plot(reg_pars[[1]], reg_pars[[2]])
