#========================#
#Exercise Lesson 3 Part C#
#========================#

#Install and load fOptions package
install.packages("fOptions")
library("fOptions")

#Initial parameters
St<-39 #underlying price
K<- 40 #strike price
T1<- 0.5 #six months time to expiration
r<- 0.02 #risk free rate
b<- 0.02 #cost of carry
sigma <- 0.2 #volatility

#computes true option price using our BS formula
source("BS.R")
TrueBSCallPrice<- BS(S0, K, r, T1, sigma, "C")
TrueBSPutPrice<- BS(S0, K, r, T1, sigma, "P")

#Call and Put prices via fOptions BS formula
call<- GBSOption('c',39,40,0.5,0.02,0.02,0.2)
call.price<- GBSOption('c',39,40,0.5,0.02,0.02,0.2)@price
put<- GBSOption('p',39,40,0.5,0.02,0.02,0.2)
put.price<- GBSOption('p',39,40,0.5,0.02,0.02,0.2)@price

#Put-call parity
call.price - St + K*exp(-r*T1) #-put.price

#Call and Put prices via Binomial Tree
n<- 2
CRRTree<- BinomialTreeOption('ce',St,K,T1,r,r,sigma,n)
BinomialTreePlot(CRRTree)

#Comparison between the two methodology
CRRTree[1,1] == call.price

#Payoff
f.call <- function(x) sapply(x, function(x) max(c(x - K, 0))) 
f.put <- function(x) sapply(x, function(x) max(c(K - x, 0))) 
K <- 1
curve(f.call, 0, 2, main = "Payoff functions", col = "blue", lty = 1, lwd = 1, ylab = expression(f(x)))
curve(f.put, 0, 2, col ="black", add = TRUE, lty = 2, lwd = 2) 
legend(0.9, 0.8, c("call", "put"), lty = c(1, 2), col = c("blue", "black"), lwd = c(2, 2))

#Implied Volatility
Volatility<- GBSVolatility(call.price,'c',St,K,T1,r,b)

