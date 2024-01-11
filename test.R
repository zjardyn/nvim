# install.packages("tidyverse")
library(tidyverse)

dat <- cars

ggplot(dat, aes(x = speed, y = dist)) +
        geom_point()
