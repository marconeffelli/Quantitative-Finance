#Class exercise 1 - Part B

#Let
P0 <- 80
P1 <- 85
P2 <- 90

#Simple returns
R1 <- (P1-P0)/P0
R2 <- (P2-P1)/P1
RFull <- (P2-P0)/P0

#log-returns
r1 <- log(P1/P0)
r2 <- log(P2/P1)
#r1 <- log(P1) - log(P0)
#r2 <- log(P2) - log(P1)
rFull <- log(P2/P0)

#Veryfing time aggregation rule
#for arithmetic
R1+R2 == RFull

#for geometric
#round(rFull, digits=6)
r1+r2 == rFull

