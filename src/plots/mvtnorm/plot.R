library(mvtnorm)

x_points <- seq(-3,3, length.out=100)
y_points <- x_points

z <- matrix(0, nrow=100, ncol=100)

rho <- 0.5


make_z <- function(rho){
    mu <- c(0,0)
    sigma <- matrix(c(1,rho,rho,1), nrow=2)

    for(i in 1:100){
        for(j in 1:100){
            z[i,j] <- dmvnorm(c(x_points[i], y_points[j]), mean=mu, sigma=sigma)
        }
    }
return(z)
}

z0 <- make_z(0)
zpos <- make_z(+0.7)
zneg <- make_z(-0.7)



pdf(file="mvrnorm.pdf", width=0.7*11.7, height=0.7*11.7/3, paper="special" )

par(mfrow=c(1,3))
contour(x_points, y_points, z0, asp=1, main=paste0("corr= ",   0)); abline(a=0, b=1)
contour(x_points, y_points, zpos,asp=1, main=paste0("corr= ", 0.7)); abline(a=0, b=1)
contour(x_points, y_points, zneg,asp=1, main=paste0("corr= - 0.7 ")); abline(a=0, b=1)

dev.off()


