#Install and load package "Quantmod"
install.packages("quantmod")
library(quantmod)

#get prices from Yahoo for S&P500 (SPX is the ticker)
start <- as.Date("2017-01-01")
end <- as.Date("2017-10-01")
getSymbols("SPX", src = "yahoo", from = start, to = end)

#get information about SPX
class(SPX)
head(SPX)
View(SPX)

#Plot SPX
plot(SPX[, "SPX.Adjusted"], main = "SPX")
plot(SPX, main = "SPX")


#The as. command forces the object to change
spx <- as.xts(data.frame(SPX = SPX[, "SPX.Close"]))

#Get geometric returns
spx_geometric_return <- diff(log(spx))

#Get info
head(spx_geometric_return)
View (spx_geometric_return)

#Plot geometric returns
plot(as.zoo(spx_geometric_return), screens = 1, lty = 1:3, xlab = "Date", ylab = "Return")
legend("topleft", "SPX", lty = 1:3, cex = 0.5)


