#
# Black-Scholes Greeks
#

BSGreeks <-function(S, K, r, T1, sigma, type){
  d1 <- (log(S/K) + (r + sigma^2/2)*T1) / (sigma*sqrt(T1))
  d2 <- d1 - sigma*sqrt(T1)
  if(type=="Delta"){
    value <- pnorm(d1)
  }
  else if(type=="Gamma"){
    value <- dnorm(d1)/(S*sigma*sqrt(T1))
  }
  else if(type=="Vega"){
    value <- S*dnorm(d1)*sqrt(T1)
  }
  else if(type=="Theta"){
    value <- -(S*dnorm(d1)*sigma)/(2*sqrt(T1))-r*K*exp(-r*T1)*pnorm(d2)
  }
  else {
    value <- K*T1*exp(-r*T1)*pnorm(d2)
  }
  return(value)
}


S<- 49
K<- 50
r<- 0.05
T1<- 0.3846
sigma<- 0.2
type<- "Theta"
#source("BSGreeks.R")
result<- BSGreeks(S, K, r, T1, sigma, type)

