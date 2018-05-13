#======================================#
#Stock Price - Simulation              #
#======================================#
Stock.Price<- function(n,m,T1,S0,r,sigma){
  dt<- T1/n
  #Pre-allocation
  gbm<- matrix(0,n+1,m)
  #Simulate Gaussian rv
  Wt<- matrix(rnorm(n*m, 0, sqrt(dt)), n, m)
  #simulate increments GBM dX
  dX <- (r-sigma^2/2)*dt+sigma*Wt
  #Cumulate increments
  cdX<- apply(dX,2,diffinv) 
  gbm<- S0*exp(cdX)
  return(gbm)
}












#set.seed(80)
#n<-250
#m<-10
#T1<-1
#S0<-100
#r<-0.2
#sigma<-0.3
#price<- Stock.Price(n,m,T1,S0,r,sigma)
#timestep<- seq(0,1,T1/n)
#Eprice<- S0*exp(timestep*r)
#matplot(timestep,price,type='l')
#lines(timestep,Eprice,col="black")
