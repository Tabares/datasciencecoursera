#Intro to R
  
##R 1.1 - Initial Setup and Navigation
###Strategies that will make beginning R users more efficient: writing code using a "script" and navigating through directories within R

3+4 #ctrl|cmd + return
5*5
2+1 #select code and ctrl|cmd+ret
getwd() #r current directory
setwd("/Adl Box/My Box Files/mooc CompDataA.R/Week 1")  #or cmd+d

  
--------------------------------------
    
##R 1.2 - Calculations and Variables

sqrt(16)
factorial(4)
4*3*2*1
x<-4
x*x
sqrt(x)
  
my.height <- 5*12 +8
my.height

--------------------------------------
    
##R 1.3 - Create and Work With Vectors

c(2,3,5,7,11,13,17,19,23,101)  
v <- c(2,3,5,7,11,13,17,19,23,101)
v[3]

look.at <- 1:3

v[look.at]

head(v)
tail(v)
v
tail(v,3)

--------------------------------------
  
##R 1.4 - Character and Boolean Vectors

v<-c("Gangnam style","charlie biut my finger", "evolutuion of dance","rickroll","lady Gaga")
length(v)

TRUE
FALSE

c(TRUE, FALSE,TRUE)

nchar(v) 
under.10 <- nchar(v) < 10
v[under.10]

--------------------------------------

##R 1.5 - Vector Arithmetic

v <- c(10,20,30,40,50,60)
v+1
2*v

w <- 2:7
w
v*w #element wise multiplication

w <- c(5,10)
v*w

w<- seq(5,20,5)
v*w

v^2
p <- 2:7
v
p
v^p
sqrt(v)

------------------------------------------

##R 1.6 - Building and Subsetting Matrices

v <- 1:12   # create vector first and the matrix
  
matrix(v, nrow=3, ncol=4)
matrix(v,3,4)
matrix(v,3)
matrix(v,4)
matrix(v,ncol=4)

matrix(0,3,4)
matrix(11:13,3,4)
matrix(11:13,3,4, byrow= TRUE)

m <- matrix(11:13,3,4, byrow= TRUE)
dim (m)
length(m)
head(m,1)
tail(m,1)

m <- matrix(1:12,3,4)
m[2,4]
m[2,] #just a row
m[,4] #just a column
m[1:2,4]
m[1:2,3:4]
m[3]
m[5]

--------------------------------------------------------

##R 1.7 - Section 1 Review and Help Files

c(2,3,5,7,1:5)
25:30
v <- 25:60
length(v)
head(v)
tail(v)

letters
letters[5:10]

m <-matrix(1:15,3,5)
m[1:2,3:5]

?seq #help

--------------------------------------------------------
  
##R 2.1 Loading Data and Working With Data Frames 

getwd()
list.files()
setwd("/Adl Box/My Box Files/mooc CompDataA.R/Week 1")

data <- read.csv("01 hw1_data.csv")
dim(data)
head(data,2)
length(data)

data[2:4, 2:4]
data[,1]
names(data) #acccess variables names
data$Temp
mean(data$Temp)
sd(data$Temp)
summary(data$Temp)

#subset function
high.temps <- subset( data, Temp >90)
high.temps
subset( data, Temp >90, select=c("Month","Day"))

data$Verified
as.character(data$Verified) #convert the factor to a string

-----------------------------------------------
  
##R 2.2 - Loading Data, Object Summaries, and Dates

setwd("/Adl Box/My Box Files/mooc CompDataA.R/Week 1")
stocks <- read.delim("stocks.txt") #tab delimited
head(stocks,3)
tail(stocks,3)
str( stocks) # better overview
summary(stocks)

names(stocks)
head(stocks$Date, 10)
as.Date(stocks$Date, "%d-%b-%Y" )
?strptime #Date-time Conversion Functions to and from Character
s.date <- as.Date(stocks$Date, "%d-%b-%Y" )
stocks$Date <- s.date
#stocks$Date <- as.Date(stocks$Date, "%d-%b-%Y" )
#FB <- subset(stocks, ticker == "FB")
plot(stocks$Date, stocks$Open, type="l")

-------------------------------------------

stocks <- read.delim("stocks500T.txt")
head(stocks,3)
names(stocks)
head(stocks$date,3)

  #example format notations
  # 20130131      %Y%m%d
  # 01/31/2013    %m/%d/%Y
  # Jan. 1, 13    %b. %d, %y
  # January 1, 13 %B %d, %y

stocks$date <- as.Date(as.character(stocks$date), "%Y%m%d" ) 
GOOG <- subset(stocks, ticker == "GOOG")
head(GOOG,3)
plot( GOOG$date, GOOG$open, type="l")
GOOG

---------------------------------------------

##R 2.3 - if() Statements, Logical Operators, and the which() Function

setwd("/Adl Box/My Box Files/mooc CompDataA.R/Week 1")
stocks <- read.delim("stocks500T.txt") #stocks500Test.txt
names(stocks)
head(stocks,3)
stocks$date <- as.Date(as.character(stocks$date), "%Y%m%d" ) #20130131
stocks <- na.omit(stocks) #omint any row that has NA values

if(stocks$close.last[1] > stocks$open[1]){
  #code to run if condition is satisfied
  status <- "up"
}else if (stocks$close.last[1] < stocks$open[1]){
  status <- "down"
}else{
  status <- "flat"
}
status

cond <- stocks$close.last > stocks$open
status <- ifelse(cond, "up", "flat")
cond <- stocks$close.last < stocks$open
status <- ifelse(cond, "down", status)
head(status)
table(status)

x <- sample(-1:13,10) #vector with 10 radom integers
y <- sample(-1:13,10)  
x > 0 #to know if all elements in X are > 0
all(x>0)

x==y
any(x==y)

x>0 & y>0
x>0 | y>0
?xor

fluctuation <- (stocks$high - stocks$low)/ stocks$open
head( fluctuation)
big.change<- abs( fluctuation) > 0.25
head( big.change) #boolean vector of true and false
which( big.change) #return trues

--------------------------------------

##R 2.4 - for() Loops and Handling Missing Observations

setwd("/Adl Box/My Box Files/mooc CompDataA.R/Week 1")
stocks <- read.delim("stocks500T.txt") #stocks500Test.txt
names( stocks)
x<- c()
for (i in 1:100){
  x <- append( x, i^2)
}
x  

the.tickers <- unique(stocks$ticker)
the.tickers

lows<-c()
highs<-c()
for  ( ticker in the.tickers){
  look.at <- stocks$ticker == ticker
  lows <- append(lows,min(stocks$low[look.at], na.rm=TRUE))
  highs <- append(highs, max(stocks$high[look.at], na.rm=TRUE))
  
}  #na.rm ignores NA values
the.tickers
head(lows)
head(highs)
sum(is.na(stocks$low))
sum(is.na(stocks$high))

--------------------------------------------------
##R 2.5 - Lists

x <- list()
x
x <- list(1:5,"OK", TRUE)
x
x[[1]]
x[[2]]
x[[3]]
x[["my_heigth"]] <- 173 # in cm   ( ad new items providing the char name for the item)

x$my_heigth

setwd("/Adl Box/My Box Files/mooc CompDataA.R/week 1")
stocks <- read.delim("stocks500Tsmall.txt")

names(stocks)

the.tickers <- unique(stocks$ticker)

stock.summary <- list()
#for.GOOG <- stocks$ticker == "GOOG"
#summary(stocks[for.GOOG,])
for( ticker in the.tickers){
  these <- stocks$ticker == ticker
  stock.summary[[ticker]] <- summary(stocks[these,]) 
}

stock.summary$GOOG

------------------------------------------------
  
R 3.1 - Managing the Workspace and Variable Casting
  

------------------------------------------------
------------------------------------------------

#Excercises 

##Data Handling
getwd()
list.files()
setwd("/Adl Box/My Box Files/mooc CompDataA.R/Week 1")

data <- read.csv("01 hw1_data.csv")

#What are the column names of the dataset?
names(data)
#Extract the first 2 rows of the data frame and print them to the console. 
#What does the output look like?
head(data,2)

#How many observations (i.e. rows) are in this data frame?
length(data[,1])
nrow(data)

#Extract the last 2 rows of the data frame and print them to the console. 
#What does the output look like?
tail(data,2)

#What is the value of Ozone in the 47th row?
data$Ozone[47]

#How many missing values are in the Ozone column 
#of this data frame?
missing.val<- is.na(data$Ozone)
length(data$Ozone[missing.val])

or

dz<-data$Ozone
bad <- is.na(dz)
length(dz[bad])

# What is the mean of the Ozone column in this dataset? 
# Exclude missing values (coded as NA) from this calculation.
mean(data$Ozone, na.rm=TRUE ) #this is easier

dz<-data$Ozone
bad <- is.na(dz)
clean.dz <-dz[!bad]
mean(clean.dz)

# Extract the subset of rows of the data frame 
# where Ozone values are above 31 and Temp valuesare above 90. 
#What is the mean of Solar.R in this subset?

doz  <- subset(data,data$Ozone>31) #danull<- subset(data,data[, 1]>31)
doz <- subset(doz,doz$Temp > 90) #dtmp<- subset(danull,danull[, 4]>90)
mean(doz$Solar.R)
summary(doz$Solar.R)

#What is the mean of "Temp" when "Month" is equal to 6?
dm  <- subset(data,data$Month == 6)
mean(dm$Temp)

#What was the maximum ozone value in the month of May (i.e. Month = 5)?
dm  <- subset(data,data$Month == 5)
summary(dm$Ozone)


