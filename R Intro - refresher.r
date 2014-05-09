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
#Get acquainted with performing basic computations in R, creating R objects (sometimes called "variables"), and seeing and running earlier commands that were run in the console.
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
##Learn how to create a vector in R using the c() function and the colon-notation (e.g. 1:5), find the length of a vector using the length() function, and subset vectors with bracket-notation and the head() and tail() functions.
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
##So far we've seen objects that use numbers, but R is also built to handle more types of objects. Here we explore vectors that contain strings or Boolean values (TRUE / FALSE).
  
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
##This video demystifies the different ways R performs vector arithmetic (e.g. addition and multiplication), covering topics including element-wise arithmetic, vector recycling, and how some functions are automatically applied across the elements in a vector. The seq() function is also introduced.

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
##Learn how to create a matrix with dimensions of your choosing, how recycle a vector when creating a matrix, and how to query specific characteristics of the vector using functions such as dim(), head(), and tail(). Details and potential pitfalls for subsetting a matrix using the bracket-notation are also covered.
  
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


x <- list(foo = 1:4, bar = 0.6, baz="hello")
x[c(1,3)]

x <- list(foo = 1:4, bar = 0.6, baz="hello")
name <- "foo"
x[[name]]  #ok
x$name     #not OK
x$foo      #ok

x <- list(a = list(10,12,14), b= c(3.14,2.81))
x
x[[c(1,3)]] #equal
x[[1]][[3]] #equal
x[[c(2,1)]]



x <- list(aardvark =1:5)
x$a
x[["a"]]
x[["a", exact=FALSE]]  ###partial matching

x<- matrix(1:6, 2,3)
x[1,2]
x[1,2, drop=FALSE]  #drops or keeps the dimension
x[1,, drop=TRUE]
x[1,, drop=FALSE]

  ###removing missing values
x <- c(1,2,NA,4, NA,5)
bad <- is.na(x)
bad
mean(x[!bad])

mean(x, na.rm=TRUE)
mean(x[!bad])

   ##removing NA values
x <- c(1,2,NA,4, NA,5)
y <- c("a","b",NA,"d", NA,"f")
good <- complete.cases(x,y)
x[good]
y[good]

setwd("/Adl Box/My Box Files/mooc CompDataA.R/Week 1")
airquality <- read.csv("01 hw1_data.csv")
airquality[1:6,] #head(airquality)
good<- complete.cases(airquality)
airquality[good,][1:6,] #head(airquality[good,])


--------------------------------------------------------

##R 1.7 - Section 1 Review and Help Files
##A quick review of the topics covered in the Section 1 videos: vectors, matrices, subsetting, and a few standard functions. Also learn how to access help files in R.
  
  
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
##Get a refresher on navigating directories on your computer in R, and learn to load a CSV (comma-separated values) data set in the form of a "data frame" using the read.csv() function, which is a special type of data matrix. This video also introduces factor variables and explores the data in a data frame using the dim(), head(), length(), names(), and subset() functions.
  
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
##Learn how to load data in the form of a tab-delimited text file using the read.delim(), how to get a high-level overview of an R object using the str() and summary() functions, and get a crash-course into working with dates in R with an example highlighting why this skill is so useful.
  
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
##if-else statements are a key component to any programming language. This video introduces how to effectively use these statements in R and also clarifies some nuances of logical operators in R. Two related functions are also introduced: ifelse() as a shortcut that can be used to create faster and more readable code, and the which() function that retrieves the positions in a Boolean vector that are TRUE.
  
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


#other valid if structures
if(x>3){
  y<- 10
}else{
  y<- 0
}
or
y <- if(x>3){
  10
}else{
  0
}

--------------------------------------

##R 2.4 - for() Loops and Handling Missing Observations
##This video discusses for() loops, which are a structure that can be used to execute a set of code repeatedly. Also covered in this video are the min(), max(), and append() functions, as well as how to identify and omit missing values.
  
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

#other cicles
#While
count <- 0
while(count <10){
  print (count)
  count <- count +1
}

#repeat
x0 <- 1
to1 <- 1e-8
repeat{
  x1 <- computeEstimate()
  if (abs(x1-x0)< to1){
    break
  }else{
    x0 <- x1
  }
}
#next
for ( i in 1:100){
  if(i <= 20){
    #skip first 20 iterations
    next
  }
  #do something here
  print ( i)
}

--------------------------------------------------
##R 2.5 - Lists
##Learn how to create and use lists in R, which are dynamic, flexible R objects that can hold and organize other R objects.
  
x<- list(1,"a", TRUE, 1+4i)
x
x[["newval"]] <- "123"


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
#these <- stocks$ticker == "GOOG"
#summary(stocks[these,])
for( ticker in the.tickers){
  these <- stocks$ticker == ticker  #returns a binary file for the coincidences of the ticker
  stock.summary[[ticker]] <- summary(stocks[these,])  #return the columns from the previous ticker 
}

stock.summary$TSLA

------------------------------------------------
  
##R 3.1 - Managing the Workspace and Variable Casting
##View all the objects in the workspace using ls(), remove objects using rm(), cast a variable as a different type using an as.[type]() function, and use lists or data frames to organize data or results.
  

a <- 1
b <- 2
x <- 1:10
y <- "ok"
z <- TRUE
ls() #look at the objects existing in your current workspace
rm(c) #remove specific object
rm( list=ls()) #remove all objects

x
as.numeric(x)
as.character(x)
c<-as.factor(x)
as.matrix
as.data.frame
as.list

NOTE: if you have a factor variable that also looks numeric,
always convert it to a character beffore converting it to numerical value.

results <- list()
results$gp1 <- c(40, 22, 16)
results$gp2 <- c(25, 15, 9)
results$gp3 <- c(32, 35, 12)
results$gp4 <- c(28, 19, 15)
results

ur <-  unlist(results)
mr <- matrix(ur, 4,3, byrow = TRUE)
dr <- as.data.frame(mr)
colnames(dr) <- c("n", "mean", "sd")  #assign names to the individual rows and columns of a data frame,
dr$mean
------------------------------------------------
  
##R 3.2 - The apply() Family of Functions
##When data are organized in a matrix or data frame, the apply() function can be used to calculate summaries (or apply a more complex function) across either the rows or columns of the data object. Or if summaries for each group (level) of one or more variables are desired, use the tapply() or by() function.  

rm(list=ls())
rev <- read.csv("revenue.csv", header=FALSE)
#row  - day mar1 to mar 31
#column - business
head( rev, 3)

 # i could take the sum for each column using a forloop
 # and store that result in a vector but this would actually 
 # be inneficient


 # option a
total.rev <- c()
for (i in 1:10) {
  total.rev <-c( total.rev , sum(rev[,i]))
} 
total.rev

 # option b  --APPLY--
apply (rev, 2, sum) #sum for the month for each business
#apply ( is.the.data.matrix.itself, dimmension.1=row,2colum , function to be applied) sintaxis
apply  (rev,1, sum) #summ for each day of the month

 #we can ignore the missing observations
apply  (rev,1, sum, na.rm=TRUE) 

colSums(rev)
rowSums(rev)


 # second function tapply
mk <- read.delim("mariokart.txt")
head(mk,4)
 #focus on : wheels, cond, totalPr
summary(mk)

 examine the sum of all of the total prices of auction 
 that were new and used separately 
 by providing the vector for the totalPrice as the first argument,
 the vector for the condition as the second and then the sum funciton

# tapply(data, group, function) sintaxis
tapply(mk$totalPr, mk$cond, mean)
tapply(mk$totalPr, mk$wheels, mean)

condider the influnce of both price and number of wheels
what will this do to the estimated cost of a new game vs a used one
and also the cost of an extra wheel

we can look at a table of those combinations
#mk[,c("cond","wheels")]
tapply(mk$totalPr,mk[ ,c("cond","wheels")], mean)
tapply(mk$totalPr,mk[ ,c("cond","wheels")], length) #one col has few observations
 
 # the BY function a variant of tapply, 
 # by default it returns a vector of the results

x<- by(mk$totalPr,mk[ ,c("cond","wheels")], length)
x[5]
c(x)
------------------------------------------------

##R 3.3 - Access or Create Columns in Data Frames, or Simplify a Data Frame using aggregate
##The with() function makes it easy to access many variables (columns) in a data frame for one-off calculations, the within() function can be used to create new columns that are merged with the original data frame, and aggregate() is useful for aggregating variables in a data frame across groupings based on one or more variables.
  
setwd("/Adl Box/My Box Files/mooc CompDataA.R/week 1")
mariokart <- read.delim("mariokart.txt")

head(mariokart)
closePr <- with(mariokart, totalPr- shipPr)
head(closePr, 20)

mk <- within(mariokart,{
  closePr <- totalPr - shipPr
})
head(mk)

aggregate(. ~ wheels + cond, mk, mean)
aggregate( . ~ )
. ~  keep all the variables for the output
wheels + cond these separated by a comma indicated wich var to aggregate across
mk dataframe
mean is how to aggregate the variables
aggregate( totalPr ~ wheels + cond, mk, mean )

------------------------------------------------

##R 4.1 - Basic Structure of a Function
##introduces the basic structure of a function, covering the declaration of the function, using an argument, and returning a result.

  set.seed(100) #ensure dataset is stable by using seed
d <- rpois(25,8) #poisson dist 8 deg free
d   #if i run this code ill get the same dataset

  GetMeanAndSE <- function(x){
    m <- mean(x)
    n<- length(x)
    SE <- sd(x)/sqrt(n)
    return (c(m,SE))
  }

GetMeanAndSE(d)
  
    
------------------------------------------------
  
  #R 4.2 - Returning a List and Providing Default Arguments
  Become more proficient in writing functions by learning the standard way to return more complex results from functions using a list, and learn how to specify a default value for an argument
  
set.seed(100) #ensure dataset is stable by using seed
d <- rpois(25,8) #poisson dist 8 deg free
d   #if i run this code ill get the same dataset

GetCI <- function(x, level=0.95){
  m <- mean(x)
  n<- length(x)
  SE <- sd(x)/sqrt(n)
  upper <- 1-(1-level)/2
  ci <- m + c(-1,1)*qt(upper, n-1)*SE
  return (list(mean=m,se=SE,ci=ci))
}

GetCI(d,99)  #it would be nice to report the error from function
  
------------------------------------------------
  
#R 4.3 - Add a Warning or Stop the Function Execution
#The most helpful functions return clear warnings and errors when something is wrong. This video introduces the warning() and stop() functions, which can be used within a function to report a warning to the user or stop the function's execution.

set.seed(100) #ensure dataset is stable by using seed
d <- rpois(25,8) #poisson dist 8 deg free
d   #if i run this code ill get the same dataset

GetCI <- function(x, level=0.95){
  if(level <= 0 || level >=1 ){
    #stop!
    stop("the 'level' argument must be >0 and <1")
  }
  if (level< 0.5){
    warning("Confidence levels are often close to 1, e.g. 0.95")
  }
  m <- mean(x)
  n<- length(x)
  SE <- sd(x)/sqrt(n)
  upper <- 1-(1-level)/2
  ci <- m + c(-1,1)*qt(upper, n-1)*SE
  return (list(mean=m,se=SE,ci=ci))
}

GetCI(d,0.05)  #it would be nice to report the error from function
  
------------------------------------------------
#R 4.4 - Passing Additional Arguments Using an Ellipsis
#Sometimes it is useful to be able to pass any extra arguments to another function. For example, if a new plotting function is created that makes use of the function called plot(), it would be useful to be able to be able to specify additional details to plot() automatically. This is possible using an ellipsis, "...".

  rm(list=ls())
  setwd("/Adl Box/My Box Files/mooc CompDataA.R/week 1")
  revenue <- read.csv("revenue.csv", header=FALSE)
  head(revenue,3)
  
RevSummary <- function(x, ... ){
  if(!is.matrix(x) && !is.data.frame(x)){
    stop("'x' must be a matrix or  data frame")
  }
  elipsis.args <- list(...)
  rev.per.company <- colMeans(x, ...)
  rev.per.day     <- rowMeans(x, ...)
  return (list( rev.per.company = rev.per.company,
           rev.per.day = rev.per.day))
}

RevSummary(revenue)
RevSummary(revenue, na.rm=TRUE)
which(is.na(revenue), arr.ind=TRUE)

------------------------------------------------
#R 4.5 - Make a Returned Result Invisible and Build Recursive Function
#Use the invisible() function in place of return() in a function to prevent the output from printing to the user's screen but still allow the result to be stored into an R object. Additionally, when building a recursive function, use the Recall() function.

  annoying <- function(x){
  #return(rep(x,1000))
  invisible(rep(x,1000)) 
}

tmp <- annoying(1:3)
tmp

#clear console 
cmd -alt-L mac
ctrl -L win

RECURSIVE FUNCTIONS

logMe <- function(x){
  
  return(ifelse(x>1, logMe(log(x)) , x))
}
logMe(3.392)
logMe(exp(3.392))

------------------------------------------------
#R 4.6 - Custom Functions With apply()
#In the last section of videos, the apply() function was introduced. A prebuilt function is often used in this function, but it is also common to write a new function within apply() or to apply a custom function.
  
x <- matrix(rpois(1e4,8), 1e3) 
apply(x,2,mean)
apply(x,2, function(x) sd(x)/sqrt(length(x)))
or
apply(x,2, function(x){ sd(x)/
                          sqrt(length(x))})
tmp <- apply(x,2,GetCI) #since its a full list
tmp
is.list(tmp)   #convert it to a supper list to handle it
tmp[[1]]
.
  
------------------------------------------------
  Data sets to practice your skills
Chickweight - experimental comparing chicken feed
Insectsprays - experiment comparing insect srpays
rock - rock samples frfrom petroleum reservoir
morley - speed of light measurements from the 1879
iris - measurements of 150 flowers of diferent types
toothGrowth - data concerning vitamin C and teeth
CO2 - CO2 uptake for plants under different conditions

?ChickWeight
cw <- ChickWeight

------------------------------------------------
  #source file location http://rfunction.com/code/data/stocks.txt
------------------------------------------------
#Calculating Memory Requirements
  I have a data frame with 1,500,000 rows and 120 columns, all of which are numeric data. Roughly, how much memory is required to store this data frame?

1,500,000 × 120 × 8 bytes/numeric
= 1440000000 bytes
= 1440000000 / 220 bytes/MB
= 1,373.29 MB
= 1.34 GB

#select 100 elements at random from these 2000 values
myData <- sample(c(y, z), 100)

join the two vectors, not separated by a single space
paste(1:3 , c("X","Y","Z"), sep="")
paste(LETTERS, 1:4, sep="-")
my_char <- c("My", "name", "is")
paste( my_char, collapse= " ")

x <- c(1:20)
#R accepts negative integer indexes. 
x[c(2, 10)] #gives us ONLY the 2nd and 10th  elements of x, 
x[c(-2, -10)] #gives us all elements of x EXCEPT for the 2nd and 10 elements.
x[-c(2,10)]
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


