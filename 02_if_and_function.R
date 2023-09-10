# if -----------------------------------------------

if (FALSE){
  # Execute some code
}

ham <- 10
cheese <- 10

# Report to HQ
report <- 'blank'

if(ham >= 10 & cheese >= 10){
  report <- "Strong sales of both items"
  
}else if(ham == 0 & cheese == 0){
  report <- "Nothing sold!"
}else{
  report <- 'We had some sales'
}
print(report)

# function -----------------------------------------------
# Default Value
formal <- function(name='Sam',title='Sir'){
  return(paste(title,' ',name))
}
formal()
formal('Issac Newton')