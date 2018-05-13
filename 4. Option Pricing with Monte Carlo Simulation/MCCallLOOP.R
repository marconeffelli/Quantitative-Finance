#================================#
#  MC simulation - Loop Version  #
#================================#

#Define variables
S0<- 39
K<- 40
r<- 0.02
sigma<- 0.2
T1<- 0.5
M<- 1000

#Pre-allocation for loop
ST = matrix(0,M,1)

# exact simulation of the geoBM (loop version)
for (j in 1:M){
     ST[j] = S0*exp((r-sigma^2/2)*T+sigma*sqrt(T)*rnorm(1,0,1))
}

# computes the option terminal payoff
CT<- exp(-r*T1)*pmax((ST-K),0)

# MC estimate of the plain vanilla option price
MCBSCallPrice<- mean(CT) 


#computes true option price using the BS formula
source("BS.R")
TrueBSCallPrice<- BS(S0, K, r, T1, sigma, "C")





#computes standard error of the Monte Carlo price estimate
MCstd<- sd(CT)/sqrt(M)

#confidence interval parametere
alpha<- 0.95

#100*alpha% confidence interval
CI<- MCBSCallPrice + qnorm(0.5+alpha/2)*MCstd*c(-1, 1) 
