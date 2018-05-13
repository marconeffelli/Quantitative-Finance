#===================================#
#    MC - Minimum Sample Size       #
#===================================#


M<-10
d <- 0.1
MCstd<- 2
while (MCstd>d){
  # exact simulation of the geoBM (vectorized version)
  ST<- S0*exp((r-sigma^2/2)*T1+sigma*sqrt(T1)*rnorm(M,0,1))
  
  # computes the option terminal payoff
  CT<- exp(-r*T1)*pmax((ST-K),0)
  
  # MC estimate of the plain vanilla option price
  MCBSCallPrice<- mean(CT) 
  
  #computes standard error of the Monte Carlo price estimate
  MCstd<- sd(CT)/sqrt(M)
  
  #enlarge M
  M<- M+1
}
