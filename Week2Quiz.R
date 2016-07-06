cube <- function(x, n) {
x^3
}
cube(3)
cube(2)
x <- 1:10
if(x > 5) {
x <- 0
}
x <- 15
x <- 1:10
> if(x > 5) {
+     x <- 0
+ }
if(x > 5) {
x <- 0
}
x <- 15
if(x > 5) {
x <- 0
}
x <- 5
if(x > 5) {
x <- 0
}
f <- function(x) {
g <- function(y) {
y + z
}
z <- 4
x + g(x)
}
f(3)
f <- function(x) {
g <- function(y) {
y + z
}
z <- 4
x + g(x)
}
f(3)
z <- 10
f(3)
f <- function(x) {
g <- function(y) {
y + z
}
x + g(x)
}
f(3)
z <- NULL
f(3)
z <- 15
f(3)
f <- function(x) {
g <- function(y) {
y + z
}
z <- 4
x + g(x)
}
f(3)
z <- 20
f(3)
f(4)
x <- 5
y <- if(x < 3) {
NA
} else {
10
}
data <- read.csv("hw1_data.csv")
View(data)
View(data)
h <- function(x, y = NULL, d = 3L) {
z <- cbind(x, d)
if(!is.null(y))
z <- z + y
else
z <- z + f
g <- x + y / z
if(d == 3L)
return(g)
g <- g + 10
g
}
h(data)
h(data)
cbind(data, 3)
cbind(25,3L)
h(25)
savehistory("~/GitHub/RProgramming/Week2Quiz.R")
