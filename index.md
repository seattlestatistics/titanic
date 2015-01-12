---
title       : Would you survive the Titanic?
subtitle    : Using logistic regression to calculate your chances of survival
author      : James Dunlop
job         : Independent Contractor
framework   : io2012       # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Slide 1

# Background


The Titanic sunk on April 12 1912, after hitting an iceberg.  There were 1,316 passengers (crew excluded), of whom 498 survived, giving a survival rate of 38%.  

There is then the question of whether one could predict whether a passenger would survive, depending on their demographic features.

Overall, certain groups had a higher survival rate than others.  For example, the survival rate for first class passengers was 62%, while for third class passengers it was 25%.

There are a number of mathematical techniques for calculating survival.  They can create models, by which known data about a group of people is entered into the model, and the model outputs its prediction, which can be construed as a percentage chance of survival.  

The application created allows users to enter four pieces of data about a hypothetical passenger on the Titanic, and the output is the expected probability of survival.

---

## Slide 2

# Data and Analysis

Data was available for 1,309 of the the 1,316 passengers.  However data about age was missing in 263 cases, so theses cases were omitted, leaving 1046 passengers.  

A binomial logistic regression was perform, to model the chances of survival.  The four predictor variables used were passenger class, gender, age, and the number of siblings and parents travelling with them.  The model was calculated as follows:


```r
titanic <- read.csv("c:/titanic15.csv")
titanicFit <- glm(survived ~ pclass + sex + age + sibsp,family="binomial",data=titanic )
```

---

## Slide 3

# Results

The logistic regression model gave the following coefficients:


```r
titanicFit$coef
```

```
## (Intercept)      pclass     sexmale         age       sibsp 
##     4.99575    -1.15683    -2.57726    -0.03874    -0.32031
```

The coefficients were used to calculate something called logit.  Logit is used to calculate the probability of survival - details of the mathematical steps are provided in the application.  The intercept of 4.99575 is a constant - it is always put into the equation.  The coefficient pclass, of -1.15683, is passenger class, and is multiplied by a passenger's class.  Sex is coded 0 for female and 1 for male.  This means that its total is zero for women and -2.57726 for men.  The age in years is mulitiplied by -0.03874, while the number of siblings and parents is multiplied by -0.32031.  All of these five totals are added together, to give the total logit.

---

## Slide 4

# The application

The application allows users to pretend that they are a passenger on the Titanic.  They can put in whatever values for the four predictor variables they like.  This is done through two drop down menus (gender and passenger class) and two sliders (age and number of parents and siblings.)

The application gives immediate results.  It tells the user what their chances of survial would be, using the model described in the previous slide.  It also shows how the regression equation changes, as the value of the variables change.  Not only does this application give the percentage chance of survial, but it also gives the odds ratio, which is the chance of surviving divided by the chance of perishing.

As well as telling users about the Titanic, and how different demographic factors  influenced survial, it shows how binomial logistical regression works, in a way that is both simple and down to earth.
