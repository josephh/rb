# comments in Ruby follow the pound sign
def constrolStructures(type)
  if type == "loop" 
    while i < 100
      i += 1
      puts("Loop at " + i)
    end
  end 
  if type == "if"
    puts("here in if")
  elseif type == "else"
    puts("here in elseif")
  end 
end

controlStructures("loop") 
controlStructures("if") 
controlStructures("else")
