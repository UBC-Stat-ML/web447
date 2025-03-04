suppressPackageStartupMessages(require(ggplot2))
suppressPackageStartupMessages(require(dplyr))

df = read.csv(
  "https://raw.githubusercontent.com/UBC-Stat-ML/web447/1e345149a5b698ccdf0a7e9b0aeabec2463c50ca/data/sunspots-SN_m_tot_V2.0.csv",
  sep = ";", header=FALSE) %>%
  mutate(count = ceiling(V4)) %>%
  rename(year = V3) %>%
  filter(year > 2005)

counts = df$count 
time = df$year