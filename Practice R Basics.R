# R Basics script 
# Dr. Cohen - acohen@uwf.edu
# This is a gentle introduction to R basics programming
# *****************************************************


# Good habit is to comment your code so it is readable 
# ==============
# Recording 2
# ==============

# To install packages in R
#install.packages("datasets")
#install.packages("tidyverse") #I already had these install so i skipped.

# To load packages in R - assuming they are installed
library(datasets)
library(tidyverse)

# Calculator 
x=10^2 # square
y=2*x
1+2
3*4
45-89
# ==============
# Recording 3
# ==============
# Data Types and objects
# Character
l ="R is useful"
class(l)


# Logical
v1 = 5>6
7+7+1==15
class(v1)

#numeric
x = 9
X=99
y = x/2
x
y
class(x)

# Factors
x=c(0,0,1,1,2)
x=factor(x,labels = c("Control","Low Dose","High Dose"))
class(x)

# Vectors
vec1=c(1,21,50,80,45,0)
vec2=c("d","4","r")
class(vec1)
length(vec1)

# Matrices
ma1=matrix(data=c(vec1,0,0,0,0,0,150),nrow = 4,byrow = TRUE)
ma1

class(ma1)
ma2= matrix(data=c(10,45,56,90),nrow = 2)

# ==============
# Recording 4
# ==============

# Data frames
df=data.frame(x=rnorm(100),y=rnorm(100,mean = 5))
summary(df)
x=df$x
y=df$y

class(df)

# Lists
library(dslabs)
L=list(one=1, two=c(1,2),five=seq(0,1,0.1), six="student",mydata=murders) # error when running line as package was not installed to find murders
class(L)
L$five
# ==============
# Recording 5
# ==============
# Built-in functions
sum(1,3,5)
help(sum)
example(sum)
example(mean)

sum(x)
mean(x)
sd(x)
summary(x)
var(x)

# Sequence
s1=1:10
s2=seq(from = 1,to = 10)
seq(1,10,0.5)
seq(10,1)



# Named vector
r=c(1:3)
names(r) = c("f","s","t")
r[5]=2
barplot(r) #not an error but oversight as barplot 4th value is NA


# ==============
# Recording 6
# ==============
#Data sets in R

data("airquality")
mdata=cars


# Reading variables from a data.frame
mdata$speed #I ran into an error "Error: object 'mdata' not found" and was so confused I couldn't figured out why so i just restarted the r and it workded
with(mdata,mean(speed+dist))
mean(mdata$speed+mdata$dist)

# Structure and Summary
str(mdata)
summary(mdata)
print(mdata)
View(mdata)

# Creating new variables and add to global environment
mdata$time=mdata$dist/mdata$speed

mdata$speed2=mdata$speed^2

# Rename the variables #Make sure to install the package first with install.package(). I did it directly in the console
install.packages("reshape")
library(reshape)
mdata=rename(mdata,c("speed"="mspeed", "speed2"="s2"))

# Create categories from continuous variable
mdata$newdata= (mdata$mspeed >=5) + (mdata$mspeed >=10) + (mdata$mspeed >=15)  +(mdata$mspeed >=20) 
mdata$ndata= cut(mdata$mspeed, breaks = c(4,5,10), labels = c("cut0","cut1"), right = FALSE)


# Drop or keep variables in a dataset
library(datasets)
library(carData)
mdata=Salaries

submdata=subset(mdata,select = c("discipline","salary"))
submdata1=mdata[,c(1:4)]
submdata2=subset(mdata,select = c(-2,-3))

# Keep Unique values
uni=unique(mdata)

# Identify duplicated values
dup=duplicated(mdata)

# stack data sets
newdata=cbind(rnorm(50),rnorm(50))
rb=rbind(rnorm(100),rnorm(100))

## Random generations
# Normal random numbers
mdata=rnorm(100,mean = 0,sd=1)
# Histogram
hist(mdata,freq = T)
# plot
plot(mdata,
     type="p",
     col="red",
     pch=ifelse(abs(mdata)>2,1,19),
     xlim = c(-1,100),
     ylim = c(-3,4),
     xlab = "Number from SND"
     ,ylab = "Values", 
     main = "100 Obs. from Standard Normal Dist.")

dt=rnorm(30000,mean=10,sd=3)
var(dt)
quantile(dt,c(0.25,0.5,0.75,0.99))
hist(dt)
mean(dt)

install.packages("moments")
library(moments)# installed directly through console
skewness(dt) #had an error when trying to run line by line but when i ran all 3 lines together it worked. Not sure why when i loaded the library first
kurtosis(dt)

hist(dt)
hist(scale(dt))

# probability calculations
xp=pnorm(1.96)
y=pbinom(2,size = 10,prob = 0.5,lower.tail = T)
q=qnorm(0.975)

set.seed(500)
x=runif(10,min = 0,max = 1)
x2=rnorm(10)

x3=rnorm(10)
rexp(10,rate = 1)

# More functions
min(rnorm(100))
max(rnorm(100))
abs(rnorm(100))
sqrt(abs(rnorm(100)))
2**9
2^9
exp(1)
log(1)
log10(10)
log2(2)
log(45,base = 45)

factorial(3)
choose(10,5)


# Programming Tools

# if-statement

W=5
if (W<8){
  d=2
  
}else {
  d=10
}


# subset
a=c(1,2,3,4)
b=c(5,6,7,8)

f=a[b==5 | b==6]

# For-loop

h=seq(1,8)

s=numeric()
for (l in 1:8) {
  s[l]=h[l]*10
}

v=numeric()
for (k in 1:1000) {
  x=rnorm(1000)
  v[k]=var(x)
}
boxplot(v) #i tried to scale it and graph looks the same
hist(v) #tried to scale and plot looks worst hist(scale(v))

# Functions

#wanted to see how the numbers would look like with 0.33 and 0.66
myf=function(e)
{
  mi=mean(e)
  si=sd(e)
  mai=max(e)
  mii=min(e)
  qi=quantile(e,probs = c(0.33,0.5,0.66))
  
  return(data.frame("mean"=m,"std"=s,"Max"=ma,"Min"=mi))
  return(data.frame(q))
}


myfunction = function(d)
{
  m=mean(d)
  s=sd(d)
  ma=max(d)
  mi=min(d)
  q=quantile(d,probs = c(0.25,0.5,0.75))
  
  return(data.frame("mean"=m,"std"=s,"Max"=ma,"Min"=mi,q))
}


stdd = function(p,n)
{
  stdd=sqrt(p*(1-p)/n)
  
  return(stdd)
}


### Example: tenure criterion
# Number of publications 
n = 6
nbr.pub  = rnorm(n,mean=15,sd=4)
nbr.pub
# round to nearest integer
nbr.pub.rd = round(nbr.pub,0)
nbr.pub.rd

df=data.frame(ID=1:n,Nbrpb=nbr.pub.rd,Decision= rep(NA,times=n))
df

colnames(df) = c("ID","Publications","Decision")
df

# suppose tenure is only given to those with 10 or more
for(i in 1:n){
  if(df[i,2] < 15)
  {df[i,3]=c("nottenured")}
  else{df[i,3]=c("tenured")};
  
}

df
