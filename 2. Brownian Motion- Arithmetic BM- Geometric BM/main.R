#=======================#
#       Main file       #
#Run your functions here#
#=======================#
T1<-1
n<-100
m<-100

#====EX.A=====#
source('BM_LOOP.R')
set.seed(80)
ex_a_result<- BM_LOOP(n,m,T1)
matplot(ex_a_result,type = 'l')

#====EX.B=====#
source('BM_NOLOOP.R')
set.seed(80)
ex_b_result<- BM_NOLOOP(n,m,T1)
matplot(ex_b_result,type = 'l')

#====EX.C=====#
T1<-1
n<-100
m<-1
#m<-100
#m<-1000
mu<-0.2
sigma<-0.3
source('ABM.R')
set.seed(80)
ex_c_result<- ABM(n,m,T1,mu,sigma)
matplot(ex_c_result,type = 'l')
timestep<- seq(0,T1,T1/n)
ecdX<- timestep*mu
matplot(timestep,ex_c_result,type='l')
lines(timestep,ecdX,col="black")

#====EX.D=====#
T1<-1
n<-100
m<-1
#m<-100
#m<-1000
mu<-0.2
sigma<-0.3
source('GBM.R')
set.seed(80)
ex_d_result<- GBM(n,m,T1,mu,sigma)
matplot(ex_d_result,type = 'l')
timestep<- seq(0,T1,T1/n)
egbm<- exp(timestep*mu)
matplot(timestep,ex_d_result,type='l')
lines(timestep,egbm,col="black")

#====EX.E=====#
T1<-1
n<-100
m<-1
#m<-100
m<-1000
sigma<-0.3
S0<-100
r<- 0.15
source('Stock.Price.R')
set.seed(80)
ex_e_result<- Stock.Price(n,m,T1,S0,r,sigma)
matplot(ex_e_result,type = 'l')

timestep<- seq(0,1,T1/n)
Eprice<- S0*exp(timestep*r)
matplot(timestep,ex_e_result,type='l')
lines(timestep,Eprice,col="black")
