#=========================#
#Black-Scholes formula for#
#  European call and put  #
#       options           #
#=========================#

## Black-Scholes Function
BS <-function(S, K, r, T, sigma, type){
    d1 <- (log(S/K) + (r + sigma^2/2)*T) / (sigma*sqrt(T))
    d2 <- d1 - sigma*sqrt(T)
    if(type=="C"){
      value <- S*pnorm(d1) - K*exp(-r*T)*pnorm(d2)
    }
    if(type=="P"){
      value <- K*exp(-r*T)*pnorm(-d2) - S*pnorm(-d1)
    }
    return(value)
  }

S<- 39
K<- 40
r<- 0.02
T<- 0.5
sigma<- 0.5

call.price<- BS(39,40,0.02,0.5,0.2,"C")
put.price<- BS(39,40,0.02,0.5,0.2,"P")
