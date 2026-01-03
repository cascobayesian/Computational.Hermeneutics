

probs <- c(0.05,0.15,0.35,0.22,0.25,0.1,0.05,0.25,0.3,0.15,0.03)
probs <- probs/sum(probs)
vals <- 1:length(probs)

pdf('expectation_ex_disc.pdf',width=10,height=6.5)
par(cex.lab=1.5,mar=c(5,5,4,2),cex.main=3)
plot(vals,probs,xlab="",ylab="",type='h',col='black',lwd=4.5,
	xlim=c(0,11.5),axes=FALSE,main="Probability mass function")

mean.prob <- sum(probs*vals)
abline(v=mean.prob,col='red',lwd=5)
text(x=mean.prob+0.5,y=0.17,label=expression(mu),col='red',cex=5)

box()
dev.off()
N <- 1e5
means <- c(2,5,8)
sds <- c(1,1,0.5)
mix <- c(0.5,0.35,0.15)
d <- rnorm(round(mix[1]*N),means[1],sds[1])
d <- c(d,rnorm(round(mix[2]*N),means[2],sds[2]))
d <- c(d,rnorm(round(mix[3]*N),means[3],sds[3]))
out <- density(d)
mean.val <- mean(d)
pdf('expectation_ex_cont.pdf',width=10,height=6.5)
par(cex.lab=1.5,mar=c(5,5,4,2),cex.main=3)
plot(out$x,out$y,col='black',xlab="",ylab="",type='l',lwd=3,yaxs='i',main="Probability density function",
			ylim=c(0,0.225),axes=FALSE)
abline(v=mean.val,col='red',lwd=5)
box()
text(x=mean.val+0.7,y=0.195,label=expression(mu),col='red',cex=5)
M <- length(out$x)
x.b <- c(out$x,out$x[M:1])
y.b <- c(out$y,rep(0,M))
polygon(x.b,y.b,col=grey(0.5,0.5))
dev.off()
#axis(1,labels="",at=0)