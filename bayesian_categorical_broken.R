library(rstanarm)
library(tidyverse)
library(tidybayes)
library(modelr)
library(gganimate)

mydata <- read.csv("stigmatized_campaigns_simulated-data.csv")
mydata$x <- mydata$order
mydata$y <- mydata$persuasiveness
mydata$group <- mydata$attitude

# Response variable is a 7-pt Likert of how persuasive the treatment was.
# Set weakly informative prior, where mean response is neutral (4.0), the treatment effect is 0.0,
# and the SDs will (mostly) exclude values that are impossible (change of >3 from mean)
a_prior = 4
a_sd = 1.5

b1_prior = 0
b1_sd = 1.5

m = stan_glm(y ~ x * group, data = mydata,
             prior_intercept = normal(a_prior, a_sd, autoscale = FALSE),
             prior = normal(b1_prior, b1_sd, autoscale = FALSE)
)

n_lines = 100

p <- mydata %>%
  data_grid(x, group) %>%
  add_fitted_draws(m, n = n_lines, seed = 12345) %>%
  ggplot(aes(x = x, y = .value, col = group, group = group)) +
  geom_line() +
  transition_states(.draw, transition_length = 1, state_length = 1) +
  coord_cartesian(ylim = c(0, max(mydata$y, na.rm = TRUE)))

animate(p, nframes = n_lines * 2, fps = 10)
