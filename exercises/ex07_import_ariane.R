suppressPackageStartupMessages(require(ggplot2))
suppressPackageStartupMessages(require(dplyr))

df = read.csv("https://raw.githubusercontent.com/UBC-Stat-ML/web447/c0e4b4b416cc8909b3bb7b7877668b059f1390eb/data/launches.csv") %>% 
  filter(LV.Type == "Ariane 1")
success_indicators = as.integer(df$Suc_bin)