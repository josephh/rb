# arrays and hashes are indexed collections in Ruby
# ...arrays : key is an integer (zero-based in Ruby)
# ...hash : any object may be the key
# access array objects with an index [i]; new up an array with the new keyword 
# hash maps use curly braces for literals and required key-value pairs; a default value - to return when a key is not found in a hash map - may be specified on instantiation , for example h = Hash.new('empty_string')
def arrayMethod()
  emptyA = Array.new
  arrayB = [] # array constructors in Ruby...
  arrayB = [1, 'sdf', 23.33] # arrays can contain values of mixed data types
  arrayB[3] = 'Joe' # and be resized dynamically
  a = %w{ ant bee cat dog elk } # arrays of charater strings - the ruby shortcut is %w
  puts(arrayB[0])
  puts(arrayB[1])
  puts(arrayB[2])
  puts(arrayB[3])
end

def hashMethod()
instTeam = {
  'moyes'     => 'united',
  'rogers'    => 'liverpool',
  'martinez'  => 'everton'
}
  puts(instTeam['moyes']) # return the value
  puts(instTeam['ferguson']) # not in hash map - so return nil
end

arrayMethod()
hashMethod()
