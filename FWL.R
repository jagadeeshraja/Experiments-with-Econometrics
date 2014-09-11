############################
#                         ##           
# R Jagadeesh, IIT Kanpur ##         
#						  ##	   
############################

##The Frisch–Waugh–Lovell (FWL) theorem is of great practical importance for econometrics. 
##FWL establishes that it is possible to re-specify a linear regression model in terms of orthogonal complements.

#Getting the inputs for dependent and independednt variables
x1 = rnorm(60)
x2 = rnorm(60)
y1 = 1 + x1 - x2 + rnorm(60)

# AER package is used for doing applied econometric regression process in R 
library(AER) 

ols <- lm(y1 ~ x1 + X2)
print(summary(ols))

#To remove the effect of x2 on y1, we first regress x2 on y1 and save the residuals
r1 = residuals(lm(y1 ~ x2))
#regress x2 on x1 and save the residuals to remove the effect of x2 on x1
r2 = residuals(lm(x1 ~ x2))

#fwl estimates can be obtained by regressing the second residuals on the first
fwl <- lm(r1 ~ -1 + r2)
print(summary(fwl)) 

#coefficient of x1 using OLS
print(coef(lm(y1 ~ x1 + x2)))

#coefficient of x1 using Frisch–Waugh–Lovell Theorem 
print(coef(lm(r1 ~ -1 + r2)))
