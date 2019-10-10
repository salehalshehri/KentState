library(lpSolveAPI)
lprec <- make.lp(0,12)
lp.control(lprec, sense="max")
time <- c(5, 3, 4, 2, 3, 1, 4, 6, 2, 5, 4, 7) # objective function
set.objfn(lprec, 1*time)
set.type(lprec, 1:12, "binary") 
add.constraint(lprec,c(1,1),"=",1,indices = c(1,2)) # starting node
add.constraint(lprec,c(1,-1,-1),"=",0,indices = c(1,3,4)) # intermediate node
add.constraint(lprec,c(1,-1),"=",0,indices = c(2,5))
add.constraint(lprec,c(1,-1,-1),"=",0,indices = c(3,6,7))
add.constraint(lprec,c(1,1,-1,-1),"=",0,indices = c(4,5,8,9))
add.constraint(lprec,c(1, -1),"=",0,indices = c(6,10))
add.constraint(lprec,c(1,1,-1),"=",0,indices = c(7,8,11))
add.constraint(lprec,c(1,-1),"=",0,indices = c(9,12))
add.constraint(lprec,c(1,1,1),"=",1,indices = c(10,11,12)) # finish node
solve(lprec)
get.objective(lprec)
get.variables(lprec)
get.constraints(lprec)
arc <- c("x12", "x13", "x24", "x25", "x35", "x46", "x47", "x57", "x58", "x69", "x79", "x89")
vars<-get.variables(lprec)
output<-data.frame(arc,vars)
output
