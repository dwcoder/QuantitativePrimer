library(mvtnorm)
library(ggplot2)

rho <- 0.7

testrho <- function(rho=0.7, N = 1000000){
    y <- rmvnorm(10000,c(0,0), sigma=matrix(c(1,rho, rho, 1), 2, 2))
    actual    <- sqrt(1- rho)/sqrt(pi)
    simulated <- mean(apply(y, 1, max))

return(c(actual=actual, simulated=simulated))
}
testrho  <- Vectorize(testrho , "rho")

rhos <- seq(0.1, 0.95, length.out=50)
res <- data.frame(t(testrho(rhos, N=5e6)))
res$rho <- rhos

p <- ggplot(res, aes(x=actual, simulated, colour=rho))
p <- p + geom_point()
p <- p + geom_abline(slope=1)
p