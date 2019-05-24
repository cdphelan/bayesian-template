## PLOTTING FUNCTIONS FOR R TEMPLATES ##
#This file contains the default code for the plots. If needed, the plot aesthetics can be customized here.

#################### TEMPLATE 1: 1var categorical bar chart ####################
# This function generates the HOPs (animated plots) for both the prior and posterior plots
HOPs_plot_1 = function(data) {
  ggplot(data, aes(x = x, y = .value)) + #do not change
    geom_bar(stat='identity', width=0.5) + #do not change from stat='identity'. Fill and line aesthetics may be modified here, see ggplot2 documentation
    transition_states(.draw, transition_length = 1, state_length = 1) + # gganimate code to animate the plots. Do not change
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) + #rotates the x-axis text for readability
    coord_cartesian(ylim = c(min(mydata$y, na.rm=T), max(mydata$y, na.rm=T))) + # sets axis limits
    # scale_x_discrete(limits=c("before","after")) + #manually set the order of the x-axis levels
    labs(x=x_lab, y=y_lab) # axes labels
}

# This function generates the 5 static plots of prior draws.
static_prior_plot_1 = function(prior_draws) {
    ggplot(prior_draws, aes(x = x, y = .value)) +
    geom_bar(stat='identity') +
    facet_grid(cols = vars(.draw)) +
    # coord_cartesian(ylim = c(min(mydata$y, na.rm=T), max(mydata$y, na.rm=T))) + # sets axis limits
    theme(strip.background = element_blank(),
          strip.text.y = element_blank(),
          axis.text.x = element_text(angle = 45, hjust = 1),
          plot.title = element_text(hjust = 0.5)) +
    labs(x=x_lab, y=y_lab) + # axes labels
    ggtitle("Five sample draws from the priors")
}

# This function generates the static plots of posterior draws.
static_post_plot_1 = function(fit) {
  ggplot(fit, aes(x = x, y = .value)) +
    geom_bar(stat ='identity', width=0.5) +
    geom_errorbar(aes(ymin = .lower, ymax = .upper), width = .2) +
    coord_cartesian(ylim = c(min(mydata$y, na.rm=T), max(mydata$y, na.rm=T))) + # sets axis limits
    theme(strip.background = element_blank(),
          strip.text.y = element_blank(),
          axis.text.x = element_text(angle = 45, hjust = 1),
          plot.title = element_text(hjust = 0.5)) +
    labs(x=x_lab, y=y_lab) # axes labels
}


#################### TEMPLATE 2: 1var ordinal line chart ####################
# This function generates the HOPs (animated plots) for both the prior and posterior plots
HOPs_plot_2 = function(data) {
  ggplot(data, aes(x = x, y = .value, group = 1)) + #do not change
    geom_line() + #do not change
    geom_point() + #do not change
    transition_states(.draw, transition_length = 1, state_length = 1) + # gganimate code to animate the plots. Do not change
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) + #rotates the x-axis text for readability
    coord_cartesian(ylim = c(min(mydata$y, na.rm=T), max(mydata$y, na.rm=T))) + # sets axis limits
    # scale_x_discrete(limits=c("before","after")) + #manually set the order of the x-axis levels
    labs(x=x_lab, y=y_lab) # axes labels
}

# This function generates the 5 static plots of prior draws.
static_prior_plot_2 = function(prior_draws) {
  ggplot(prior_draws, aes(x = x, y = .value, group=.draw)) +
    geom_line() +
    geom_point() +
    facet_grid(cols = vars(.draw)) +
    # coord_cartesian(ylim = c(min(mydata$y, na.rm=T), max(mydata$y, na.rm=T))) + # sets axis limits
    theme(strip.background = element_blank(),
          strip.text.y = element_blank(),
          axis.text.x = element_text(angle = 45, hjust = 1),
          plot.title = element_text(hjust = 0.5)) +
    labs(x=x_lab, y=y_lab) + # axes labels
    ggtitle("Five sample draws from the priors")
}

# This function generates the static plots of posterior draws with error bars.
static_post_plot_2 = function(fit) {
  ggplot(fit, aes(x = x, y = .value, group=1)) +
    geom_line() +
    geom_errorbar(aes(ymin = .lower, ymax = .upper), width = .2) +
    coord_cartesian(ylim = c(min(mydata$y, na.rm=T), max(mydata$y, na.rm=T))) + # sets axis limits
    labs(x=x_lab, y=y_lab)
}


#################### TEMPLATE 3: 1var continuous line chart ####################
# This function generates the HOPs (animated plots) for both the prior and posterior plots
HOPs_plot_3 = function(data) {
  ggplot(data, aes(x = x, y = .value)) + #do not change
    geom_line() + #do not change
    transition_states(.draw, transition_length = 1, state_length = 1) + # gganimate code to animate the plots. Do not change
    coord_cartesian(ylim = c(min(mydata$y, na.rm=T), max(mydata$y, na.rm=T))) + # sets axis limits
    labs(x=x_lab, y=y_lab) # axes labels
}

# This function generates the static plot of 100 prior draws.
static_prior_plot_3 = function(fit) {
  ggplot(fit, aes(x = x, y = .value)) +
    geom_line(aes(group = .draw), alpha = .2) +
    labs(x=x_lab, y=y_lab) + # axes labels
    ggtitle("100 sample draws from the priors")
}

# This function generates the static plots of posterior draws with a confidence band.
static_post_plot_3a = function(fit) {
  ggplot(fit, aes(x = x, y = .value)) +
    stat_lineribbon() +
    coord_cartesian(ylim = c(min(mydata$y, na.rm=T), max(mydata$y, na.rm=T))) + # sets axis limits
    scale_fill_brewer()
}

# This function generates the static plots of 100 overlaid posterior draws.
static_post_plot_3b = function(fit) {
  ggplot(fit, aes(x = x, y = .value)) +
    geom_line(aes(group = .draw), alpha = .2) +
    coord_cartesian(ylim = c(min(mydata$y, na.rm=T), max(mydata$y, na.rm=T))) + # sets axis limits
    labs(x=x_lab, y=y_lab) # axes labels
}


#################### TEMPLATE 4: 2var categorical & categorical bar chart ####################
# This function generates the HOPs (animated plots) for both the prior and posterior plots
HOPs_plot_4 = function(data) {
  ggplot(data, aes(x = x1, y = .value, col = x2, fill = x2, group = x2)) + #do not change
    geom_bar(stat='identity', position='dodge') + #do not change from stat='identity'. Fill and line aesthetics may be modified here, see ggplot2 documentation
    transition_states(.draw, transition_length = 1, state_length = 1) + # gganimate code to animate the plots. Do not change
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) + #rotates the x-axis text for readability
    coord_cartesian(ylim = c(min(mydata$y, na.rm=T), max(mydata$y, na.rm=T))) + # sets axis limits
    # scale_x_discrete(limits=c("before","after")) + #manually set the order of the x-axis levels
    labs(x=x_lab, y=y_lab) # axes labels
}

# This function generates the 5 static plots of prior draws.
static_prior_plot_4 = function(prior_draws) {
  ggplot(prior_draws, aes(x = x1, y = .value, col = x2, fill = x2, group = x2)) +
    geom_bar(stat='identity', position='dodge') +
    facet_grid(cols = vars(.draw)) +
    # coord_cartesian(ylim = c(min(mydata$y, na.rm=T), max(mydata$y, na.rm=T))) + # sets axis limits
    theme(strip.background = element_blank(),
          strip.text.y = element_blank(),
          axis.text.x = element_text(angle = 45, hjust = 1),
          plot.title = element_text(hjust = 0.5)) +
    labs(x=x_lab, y=y_lab) + # axes labels
    ggtitle("Five sample draws from the priors")
}

# This function generates the static plots of posterior draws with error bars.
static_post_plot_4 = function(fit) {
  ggplot(fit, aes(x = x1, y = .value, fill = x2, group = x2)) +
    geom_bar(stat='identity', position='dodge') +
    geom_errorbar(aes(ymin = .lower, ymax = .upper), position = position_dodge(width = .9), width = .2) +
    coord_cartesian(ylim = c(min(mydata$y, na.rm=T), max(mydata$y, na.rm=T))) + # sets axis limits
    labs(x=x_lab, y=y_lab)
}


#################### TEMPLATE 5: 2var categorical & ordinal line chart ####################
# This function generates the HOPs (animated plots) for both the prior and posterior plots
HOPS_plot_5 = function(data) {
  ggplot(data, aes(x = x1, y = .value, col = x2, fill = x2, group = x2)) + #do not change
    geom_bar(stat='identity', position='dodge') + #do not change
    transition_states(.draw, transition_length = 1, state_length = 1) + # gganimate code to animate the plots. Do not change
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) + #rotates the x-axis text for readability
    coord_cartesian(ylim = c(min(mydata$y, na.rm=T), max(mydata$y, na.rm=T))) + # sets axis limits
    # scale_x_discrete(limits=c("before","after")) + #manually set the order of the x-axis levels
    labs(x=x_lab, y=y_lab) # axes labels
}

# This function generates the 5 static plots of prior draws.
static_prior_plot_5 = function(fit) {
  ggplot(fit, aes(x = x1, y = .value, col = x2, group = x2)) +
    geom_line(aes(group = .draw), alpha = .7) +
    geom_point(aes(group = .draw), alpha = .7) +
    facet_grid(cols = vars(x2)) +
    # coord_cartesian(ylim = c(min(mydata$y, na.rm=T), max(mydata$y, na.rm=T))) + # sets axis limits - CHANGE ME (optional)
    theme(axis.text.x = element_text(angle = 45, hjust = 1),
          plot.title = element_text(hjust = 0.5),
          legend.position="none") +
    labs(x=x_lab, y=y_lab) + # axes labels
    ggtitle("Five sample draws from the priors")
}

# This function generates the static plots of posterior draws with error bars.
static_post_plot_5 = function(fit) {
  ggplot(fit, aes(x = x1, y = .value, col = x2, fill = x2, group = x2)) +
    geom_line() + #do not change
    geom_errorbar(aes(ymin = .lower, ymax = .upper), width = .2) +
    coord_cartesian(ylim = c(min(mydata$y, na.rm=T), max(mydata$y, na.rm=T))) + # sets axis limits
    labs(x=x_lab, y=y_lab)
}



#################### TEMPLATE 6: 2var continuous & categorical line chart ####################
# This function generates the HOPs (animated plots) for both the prior and posterior plots
HOPS_plot_6 = function(data) {
  ggplot(data, aes(x = x1, y = .value, col=x2, group=x2)) + #do not change
    geom_line() + #do not change
    transition_states(.draw, transition_length = 1, state_length = 1) + # gganimate code to animate the plots. Do not change
    coord_cartesian(ylim = c(min(mydata$y, na.rm=T), max(mydata$y, na.rm=T))) + # sets axis limits
    labs(x=x_lab, y=y_lab) # axes labels
}

# This function generates the static plots of 100 prior draws.
static_prior_plot_6 = function(prior_draws) {
  ggplot(prior_draws, aes(x = x1, y = .value, col = x2, group = x2)) +
    geom_line(aes(group = .draw), alpha = .2) +
    facet_grid(cols = vars(x2)) +
    # coord_cartesian(ylim = c(min(mydata$y, na.rm=T), max(mydata$y, na.rm=T))) + # sets axis limits
    theme(plot.title = element_text(hjust = 0.5),
          legend.position="none") +
    labs(x=x_lab, y=y_lab) + # axes labels
    ggtitle("100 sample draws from the priors")
}

# This function generates the static plots of posterior draws with a confidence band.
static_post_plot_6a = function(fit) {
  ggplot(fit, aes(x = x1, y = .value, group = x2)) +
    stat_lineribbon() +
    coord_cartesian(ylim = c(min(mydata$y, na.rm=T), max(mydata$y, na.rm=T))) + # sets axis limits
    scale_fill_brewer() +
    facet_grid(cols = vars(x2)) # comment this out to plot both x vars on the same plot
}

# This function generates the static plots of 100 overlaid posterior draws.
static_post_plot_6b = function(fit) {
  ggplot(fit, aes(x = x1, y = .value, col=x2, group=x2)) +
    coord_cartesian(ylim = c(min(mydata$y, na.rm=T), max(mydata$y, na.rm=T))) + # sets axis limits
    geom_line(aes(group = .draw), alpha = .2) +
    facet_grid(cols = vars(x2)) + # comment this out to plot both x vars on the same plot
    theme(plot.title = element_text(hjust = 0.5),
          legend.position="none") +
    labs(x=x_lab, y=y_lab) # axes labels
}
