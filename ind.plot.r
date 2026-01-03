library(mosaic)

p.s.f <- 0.67
p.s.m <- 0.33

p.m <- 0.67
p.f <- 0.33

N <- 1000
sex <- c(rep("male",667),rep("female",333))
outcome <- c(rbinom(667,1,p.s.m),rbinom(333,1,p.s.f))

df <- data.frame(sex=sex,outcome=outcome)

tab <- table(df)

soft.red <- rgb(0.9,0.1,0.1,0.5)
soft.blue <- rgb(0.1,0.1,0.9,0.5)

colnames(tab) <- c("Female","Male")
rownames(tab) <- c("Died","Survived")
pdf("mosaic_emp.pdf",width=8,height=8)
par(cex=2)
mosaicplot(tab,col=c(soft.red,soft.blue),xlab="",ylab="",main="")
dev.off()

sex <- c(rep("male",667),rep("female",333))
outcome <- c(rep(0,round(667*p.s.f)),rep(1,round(667*(1-p.s.f))))
outcome <- c(outcome,rep(0,round(333*p.s.f)),rep(1,round(333*(1-p.s.f))))

df <- data.frame(sex=sex,outcome=outcome)

tab <- table(df)

soft.red <- rgb(0.9,0.1,0.1,0.5)
soft.blue <- rgb(0.1,0.1,0.9,0.5)

colnames(tab) <- c("Female","Male")
rownames(tab) <- c("Died","Survived")
pdf("mosaic_ind.pdf",width=8,height=8)
par(cex=2)
mosaicplot(tab,col=c(soft.red,soft.blue),xlab="",ylab="",main="")
dev.off()
