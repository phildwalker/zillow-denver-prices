# looking into some of the data available on zillow
# source: https://www.zillow.com/research/data/
# Tue Jan 24 23:25:28 2023 ------------------------------

zori <- readr::read_csv(here::here("data", "Zip_zori_sm_month.csv"))

library(tidyr)

CO <-
  zori %>% 
  filter(State %in% c("CO"),
         Metro %in% c("Denver-Aurora-Lakewood, CO")) %>% 
  pivot_longer(cols = 10:103, names_to = "date", values_to = "zori_value") %>% 
  mutate(date = lubridate::as_date(date))


library(ggplot2) 

CO %>% 
  ggplot(aes(date, zori_value)) +
  geom_point()+
  geom_line()+
  facet_wrap(~City)

#something weird with jumps?
  
