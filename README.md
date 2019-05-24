# Bayesian templates for beginners

UPDATE May 2019: A new version of the templates has been released. The structure of the templates has been improved to make it easier to follow along. The ggplot code that sets the plot aesthetics has been moved to the file plotting_functions.R for improved readability of the main templates.

This repo is a set of templates that will guide you through a Bayesian analysis in R, even if you have never done Bayesian analysis before. There are a set of templates, each for a different type of analysis. Over time, we will be adding to this list of templates.

The research paper that accompanies these templates is forthcoming at CHI 2019: "Some Prior(s) Experience Necessary: Templates for Getting Started in Bayesian Analysis." Links will be added once the paper is published.

Detailed instructions on how to get started are at the end of this README.

A productive way to choose which template to use is to think about what your independent variables are and what type of chart you would like to produce to summarize your data. Currently, the templates support the following:

## One independent variable

**1) Categorical**: 
<img src="images/generic_bar_chart.png" alt="bar chart" width="80" height="80"> 

Creates a bar chart; compatible with tests such as t-tests, one-way ANOVA

Use this template file:
    
    1var-categorical-bar-bayesian_template.Rmd 
    
**2) Ordinal**: 
<img src="images/generic_line-ord_chart.png" alt="line chart" width="80" height="80">

Creates a line graph; compatible with tests such as t-tests, one-way ANOVA

Use this template file:
    
    1var-ordinal-line-bayesian_template.html.Rmd
    
**3) Continuous**: 
<img src="images/generic_line_chart.png" alt="line chart" width="80" height="80">

Creates a line graph; compatible with tests such as linear regressions

Use this template file:
    
    1var-continuous-line-bayesian_template.Rmd


## Interaction of two independent variables

**4) Interaction of two categorical**:
<img src="images/generic_2bar_chart.png" alt="bar chart" width="80" height="80">

Creates a bar chart; compatible with tests such as two-way ANOVA

Use this template file:

	2var-categorical-bar-bayesian_template.Rmd

**5) Interaction of one categorical, one ordinal**:
<img src="images/generic_2line_chart.png" alt="line chart" width="80" height="80">

Creates a line graph; compatible with tests such as two-way ANOVA

Use this template file:

	2var-categorical_ordinal-line-bayesian_template.Rmd

**6) Interaction of one categorical, one continuous**:
<img src="images/generic_2line-cont_chart.png" alt="line chart" width="80" height="80">

Creates a line graph; compatible with tests such as linear regressions with multiple lines

Use this template file:
    
    2var-continuous_categorical-line-bayesian_template.Rmd

# Getting started

1) If you do not have RStudio already installed, install it from here: https://www.rstudio.com/products/rstudio/download/#download 

2) Clone the repo (if you're familiar with git) or download a zip file of the repository contents here: https://github.com/cdphelan/bayesian-template/archive/master.zip

3) Open the file bayesian-template.Rproj as a project in RStudio to get started. 

4) Explore the templates as you would like! We suggest that you use the pre-knitted HTML documents (found in the folder /html_outputs/) as a reference, so you can read the instructions more easily and see a complete example as you work.

5) Open the .Rmd template files when you are ready to start editing code. 

