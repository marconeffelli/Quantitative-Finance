#==========================================#
#Arithmetic Brownian Motion - MC Simulation#
#==========================================#
ABM<- function(n,m,T1,mu,sigma){
  dt<- T1/n
  #Pre-allocation
  cdX<- matrix(0,n+1,m)
  #Simulate Gaussian rv
  Wt<- matrix(rnorm(n*m, 0, sqrt(dt)), n, m)
  #insert simulation in ABM equation
  dX<- mu*dt+sigma*Wt
  #Cumulate increments
  cdX<- apply(dX,2,diffinv)
  return(cdX)
}












#set.seed(80)
#ABM_simul<- ABM(250,1000,1,0.2,0.3)
#timestep<- seq(0,1,1/250)
#ecdX<- timestep*0.2
#matplot(timestep,ABM_simul,type='l')
#lines(timestep,ecdX,col="black")
