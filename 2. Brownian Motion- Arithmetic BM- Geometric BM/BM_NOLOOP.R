#===============================#
#Brownian Motion - MC Simulation#
#===============================#
BM_NOLOOP<- function(n,m,T1){
  Delta<- T1/n
  #Pre-allocation of the matrix for many brownian paths
  Wt <- matrix(0, n+1, m)
  #Generate m*n Gaussian simulations stored in matrix u (n*m)
  u <- matrix(rnorm(n*m,0,sqrt(Delta)), n,m)
  #Generate m paths with diffinv function
  Wt<- apply(u,2, diffinv)
  return(Wt)
}
#set.seed(80)
#a<- BM_NOLOOP(100,1,1)
#matplot(a,type = 'l')

