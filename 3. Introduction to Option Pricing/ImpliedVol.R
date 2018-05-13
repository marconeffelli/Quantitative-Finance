#========================#
#   Implied Volatility   #
#========================#

#Define Initial Parameters
St<- 39
K<- 40
r<- 0.02
T1<- 0.5
call.price<- 1.927437

#Define function to calculate root
f <- function(x,St,K,r,T1){
  St*pnorm((log(St/K)+(r+x^2/2)*T1)/(x*sqrt(T1)))-K*exp(-r*T1)*pnorm((log(St/K)+(r-x^2/2)*T1)/(x*sqrt(T1)))-call.price
}

#Calculate root
xmin<- uniroot(f,c(0.01,10),tol=.Machine$double.eps,St,K,r,T1)

#Store Implied Volatilty
sigma_IV<-xmin$root
print(sigma_IV)
