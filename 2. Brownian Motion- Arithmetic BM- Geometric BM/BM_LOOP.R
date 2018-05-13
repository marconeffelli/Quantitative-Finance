#===============================#
#Brownian Motion - MC Simulation#
#Loop Version                   #
#===============================#
BM_LOOP<- function(n,m,T1){
  Delta<- T1/n
  #Pre-allocation of the matrix for simulating brownian paths
  Wt <- matrix(0, n+1, m)
  #Loop to create m paths
  for (i in 1:m)
  {
    u <- rnorm(n, 0, sqrt(Delta))
    #Loop to cumulate n simulations
    for (j in 2:(n+1))
      {
      Wt[j,i] <- Wt[(j-1),i]+u[j-1]
    }
  }
  return(Wt)
}
#set.seed(80)
#a<- BM_LOOP(100,1,1)
#matplot(a,type = 'l')
