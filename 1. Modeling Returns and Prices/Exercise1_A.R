#Class exercise 1 - Part A

#Let
Delta <- 10/250
P1 <- 105
P0 <- 100

#Calculate the 10-days simple returns
R10 <- (P1-P0)/P0
print(R10)

#Calculate the 10-days log-returns
r10 <- log(P1/P0)
print(r10)

#Calculate annualised simple returns
R10_ann <- 1/Delta*R10
print(R10_ann)

#Calculate annualised log-returns
r10_ann <- 1/Delta*r10
print(r10_ann)

#Compare log and simple returns
R10 == r10
R10 >= r10

#From log-returns to simple
exp(r10)-1

#From simple returns to log-returns
log(1+R10)
