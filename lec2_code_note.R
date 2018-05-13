# control structure
a = 3
if (a == 3){
  x = 3
}else{
  x= 5
}

print(x)

for(i in 1:10){
  print(i)
}

x = c("a","b","c")
for (letter in x){
  print(letter)
}

# next and return
for(i in 1:100){
  for(i<=20){
    next
  }
  # do something
}

# function in R
add <- function(x,y){
  rtn_val = x + y
  rtn_val
} 

# Dates and Times 日期与时间
date = as.Date("1999-10-01")
    # generative functions
      # weekdays(), months(), quarters()
      # strptime() 

# 返回逻辑值序列，表示table中每条record是否完整
complete.cases() 