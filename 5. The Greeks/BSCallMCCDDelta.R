# The following function computes the central-difference (CD) estimate of
# the plain vanilla call option delta using perturbation parameter h.

 
BSCallMCCDDelta<- function(S0, h, K, sigma, r, T, M){
b<-  r-sigma^2/2
# simulates terminal stock price using initial S0-h
ST_minus_h<-  (S0-h)*exp(b*T+sigma*sqrt(T)*rnorm(M,0,1))
# re-simulates terminal stock price using initial S0+h
ST_plus_h = (S0+h)*exp(b*T+sigma*sqrt(T)*rnorm(M,0,1))
# simulates samples of the terminal disc payoff of the option for initial S0-h
C_minus_h = exp(-r*T)*pmax(ST_minus_h-K,0) 
# re-simulates samples of the terminal disc payoff of the option for initial S0+h
C_plus_h = exp(-r*T)*pmax(ST_plus_h-K,0) 
# computes the option price estimate for initial S0-h
MCPrice_minus_h<- mean(C_minus_h) 
# re-computes the option price estimate for initial S0+h
MCPrice_plus_h<- mean(C_plus_h) 
# computes the central-difference delta estimate
MCCDDelta<- (MCPrice_plus_h - MCPrice_minus_h)/(2*h) 
}

h<- 5
T<- 1
sigma<- 0.3
r<- 0.04
K<- 100
S0<- 100
M<-1000
result<- BSCallMCCDDelta(S0, h, K, sigma, r, T, M)
print(result)

#Check with black sholes
