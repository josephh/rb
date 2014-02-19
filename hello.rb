# ruby lines have no terminator other than end of line
# comments have start with a hash sign
# 
# Basic ruby program
def sayGoodnight(name)
 result = "Goodnight," + name
 return result
end

puts (sayGoodnight('Jimmy')) # when using single quotes for a string Ruby doesn't do much...
puts(sayGoodnight("Maggie")) # when using double quotes ruby will substitute backslash escaped characters with binary values
puts (sayGoodnight("goodnight \ngrandma"))
exp = 'Joe'
puts (sayGoodnight("goodnight #{exp}"))  # ruby will also perform expression interpolation (evaluate an expression...).  braces can be left out for global, instance, class variable.  also expression can be arbitrarily complex
puts (sayGoodnight("two square #{2*2}"))

