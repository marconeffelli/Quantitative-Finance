#======================================#
#Geometric Brownian Motion - Simulation#
#======================================#
GBM<- function(n,m,T1,mu,sigma){
  dt<- T1/n
  #Pre-allocation
  gbm<- matrix(0,n+1,m)
  #Simulate Gaussian rv
  Wt<- matrix(rnorm(n*m, 0, sqrt(dt)), n, m)
  #simulate increments GBM dX
  dX <- (mu-sigma^2/2)*dt+sigma*Wt
  #Cumulate increments
  cdX<- apply(dX,2,diffinv) 
  #Get GBM increments
  gbm<- exp(cdX)
  return(gbm)
}










#set.seed(80)
#GBM_simul<- GBM(250,1000,1,0.2,0.3)
#timestep<- seq(0,1,1/250)
#Egbm<- exp(timestep*0.2)
#matplot(timestep,GBM_simul,type='l')
#lines(timestep,Egbm,col="black")
