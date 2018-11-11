 Ruby fluency drills
Practice until these patterns and their explanations are second nature

## Basic Data Manipulation


### (string) return a portion of string based on character index / indices.
```ruby
'hello'.slice(0)
# or 
'hello'.slice(0..2)
# or
'hello'.slice(0, 2)
# or
'hello'[0] # same argument formats accepted
```

### (string) return length/ number of characters in string.  Bonus: return length without spaces
```ruby
str = 'This is my string.'

str.length

# to count without including spaces
str.count('^ ')

# or
str.gsub(' ', '').length

# or 
str.delete(' ').length

# or
str.length - str.count(' ')

# to count only alphabetic characters
str.count('A-Za-z') # NOT `str.count('A-z')`; in ASCII there are 6 non-letter characters between the `Z` and the `a`.
```

### (string) return number of specified characters in string. Bonus: return number of specified characters without invoking `.count`

```ruby
str = 'This is my string.'

str.count('i') 

# or if counting a number of characters
str.count('aeiou')

# bonus
str = 'This is my string.'
str.scan('i').length # or `str.scan(/[aeiou]/).length

# or bonus
str = "thIS IS nOt, IS not, a string?"
counter = 0
letters_counted = 'a'..'z'
str.each_char { |char| counter += 1 if letters_counted.include?(char) }
p counter

# or bonus
str = 'This is my string.'
counter = 0
(0...str.length).each {|ind| counter += 1 if str[ind] == 'i' }
p counter

# or bonus
str = "hello! this this is is not a string?"
index = 0
count = 0
until index == str.length
  count += 1 if str[index] == 'i'
  index += 1
end
p count
```

### (string) return number of specified sub-strings (or words) in string
```ruby 
str = 'So this is my string, is it?'

str.split.count('is')

# NB: to prevent potential problems with punctuation and to target only whole words
str.delete('^ A-Za-z').split.count('is')
# or 
str.scan(/\bis\b/).size

# or with manual counting
total = 0
str.split.each { |word| total += 1 if word == 'is' }
total

# or
str.scan('is').length # NB: this will return a count of an instance of 'is', even within other words
```

### (string) delete specified characters in string
```ruby
str = 'This is my string.'

str.delete('is') # NB: deletes 'i' and 's' in any occurrence 
# or 
str.delete!('is')
# or 
str.delete('a-z', '^i-s')
```

### (string) delete characters at specified indices in string
```ruby
str = 'This is my string.'


str.slice!(1)
# or
str.slice!(1..4)

# without convenience methods:

def slice_str!(string, start, n)
  if (start + n > string.length - 1) || n < 0 || start < 0
    p 'Error: cannot do that'
    return
  end

  write = start

  n.times do
    string[write] = ''
  end
end
```

### (string) return index of specified characters (first occurrence); bonus: return index of specified characters (first occurrence) starting at given index; double bonus: return index of second occurrence of character using one line of code
```ruby
str = 'This is my string.'

str.index('m')

# bonus

str.index('i', 3)

# double bonus

str.index('i', str.index('i') + 1)
```

### (string) add specified characters to start of string; Bonus: do so n times using one line
```ruby
str = 'Hey, it is Friday!'

str.prepend('!!')
```
  - Bonus: do so n times using one line

```ruby
str = 'Hey, it is Friday!'

3.times {str.prepend('!!')}
```

### (string) return index of specified characters (last occurrence); Bonus: return index of specified characters (last occurrence) up to a given index as stop point. Double bonus: return index of next-to-last occurrence of character without providing integer for stop-at index

```ruby
str = 'This is my string, maybe my string.'

str.rindex('s')

# bonus

str.rindex('s', 20)

# double bonus

str.rindex('s', str.rindex('s') - 1)
```

### (string) add specified characters to end of string
```ruby
str = 'Hey, it is Friday!'

str.concat(' Yes')
# or
str << ' yes'
```
  - Bonus: do so n times using one line
  
```ruby
str = 'Hey, it is Friday!'

3.times {str.concat(' Yes')}

```

### (string) add / insert specified characters at specified indices in string
```ruby
str = 'Hey, it is Friday!'

str.insert(3, 'eee')
# or 
str.insert(-2, 'aaa')
```

```javascript
// JS string primitives are immutable; must return new string
// and reassign

let str = 'Hey, it is Friday!';

str = str.split(0, 3) + 'eee' + str.split(3);
```


###  insert specified word prior to given existing word
```ruby
str = 'Hey, it is Friday!'

str.insert(str.index('Fri'), 'not ')
```


### (string) substitute given character for another
```ruby
str = 'Hey, now it is not Friday.'

str.gsub('i', '!!!')
# or 
str.gsub!('i', '!!!')
```

### (string) reverse character order in string
```ruby
str = 'Hey, now it is not Friday.'
str.reverse
```

```javascript
myStr.split('').reverse().join('');
```

 - bonus: reverse without using `.reverse`
 ```ruby
 str = 'Hey, now it is not Friday.'
 
 reversed = []
 split = str.split('')
 while split.length > 0
   reversed.push split.pop
 end
 reversed.join
 
 # non-destructive
 
string = 'hello'
rev = ''

string.chars.each { |chr| rev.insert(0, chr) }
```
 
 - double bonus: reverse order without changing string to array first (i.e. without iterating through an array) 
   
```javascript
let string = 'hello';
let rev = '';

for (let i = string.length - 1; i >= 0; i--) {
    rev += string[i];
}
```

```ruby
# or to change in place
str = 'This is The string, is it not?'

index = 1
while index < str.length
  str.insert(0, str.slice!(index)
  index += 1
end

str   

# in O(N/2) time:
def reverse_string!(str)
  left = 0
  right = str.length - 1

  while left < right
    str[left], str[right] = str[right], str[left]
    left += 1
    right -= 1
  end
end
```
   
### (string) determine if given characters are present in string. (use regex and non-regex methods)
```ruby
str = 'Oh, what beautiful weather today!'

str.include?('O')
# also effective, depending on the return one is seeking
str.scan('O') # returns array of matched patterns

# regex

str=~(/[ao]/)
str.match(/[ao]/)
```

### (string) return array of characters matching a pattern (may use regex)
```ruby
str = 'Oh, what beautiful weather today!'

str.scan('t')

# or
str.chars.select { |char| char < 'l'}

# or
str.scan(/[aeiou]/)
```

### return an array of words taken from a string that meet given conditions (may use regex).
```ruby
str = 'Oh, what beautiful weather today!'

str.split.select {|word| word.length <= 6 }

#or 
str.scan(/\b\w{2,4}\b/)
```

### (string) return new string (or modify existing string) to have all characters lowercased
```ruby
string = 'This IS tHe tEST string'
string.downcase

string.downcase!
```

### (string) return new string (or modify existing string) to have all characters uppercased
```ruby
string = 'This IS tHe tEST string'
string.upcase

string.upcase!
```

### (string) return new string (or modify existing string) to have sentence case
```ruby
string = 'This IS tHe tEST string'
string.capitalize

string.capitalize!
```

```javascript
// NB: JS primitive strings are immutable

let myStr = 'This IS tHe tEST string';

myStr[0].toUpperCase() + myStr.slice(1).toLowerCase();
```

### (string) return new string (or modify existing string) to have all cases switch
```ruby
string = 'This IS tHe tEST string'
string.swapcase

string.swapcase!
```

### From a given string, return the string minus all punctuation and special characters.  Bonus: return an array of words in the string, minus all punctuation and special characters.

```ruby
str = "WHat? Hello thIS is IS not nOt, IS not, a string???!!??"

str.delete('^ A-Za-z')

# Bonus

str.delete('^ A-Za-z').split
```

### swap the places of two characters in a string using one line. reassign a slice of the string to new values. Bonus: swap places / reassign 'manually'.

```ruby
string = 'Hello!'

string[0], string[1] = string[1], string[0]

string[-2..-1] = '!!'

# manually

str = "Hi, hello world!"

def swapper(string, index1, index2)
  last = string.slice!(index2)
  first = string.slice!(index1)
  string.insert(index1, last)
  string.insert(index2, first)
  string
end

```

### 1) Return a new string with leading and trailing whitespace removed.  2) Remove leading and trailing whitespace from a string.  3) Perform previous tasks on only leading or only trailing whitespace.

```ruby
str = '   hello   '
# 1
str.strip
# or 
str.gsub(/(^\s+|\s+$)/, '')

# 2
str.strip!

# 3
str.lstrip
# or
str.rstrip
```

```javascript
let str = '    hello   ';

str.trim();
// or
str.replace(/(^\s+|\s+$)/g, '');

str.trimEnd();

str.trimStart();
```


### 1) Return a new string with each consecutive run of any character replaced by single instance of the character.  2) Return a new string with all consecutive runs of given characters replaced by a single instance of the character.  3) Do either of the previous tasks manually.

```ruby
str = '  this issss my,, string'

# 1
str.squeeze

# 2
str.squeeze(' ,')

# 3

squeezed = ''

str.chars.each do |char|
  next if char == squeezed[-1]
  squeezed << char
end

p squeezed
```


### Return the integer that represents a given character; return the binary representation of that integer; return the integer equivalent of the binary and then return the original character

```ruby
'a'.ord
'a'.ord.to_s(2)
'a'.ord.to_s(2).to_i(2)
'a'.ord.to_s(2).to_i(2).chr

```

```javascript
let myStr = 'hello';

String.fromCharCode(parseInt(myStr.charCodeAt(0).toString(2), 2));
```

### Identify and return the first element that matches a block.

```ruby
arr = [1, 2, 3, 4, 5]

arr.find { |n| n > 3 }
```


### swap the places of two characters in an array using one line. reassign a slice of the array to new values. Bonus: swap places / reassign 'manually'.

```ruby
array = [1, 2, 3, 4]

array[1], array[2] = array[2], array[1]

array[-2..-1] = [:hello, :new]

# manually
array = [1, 90, 2, 1, 2, 4, 3, 10, 45]

mv2 = array.delete_at(5)
mv1 = array.delete_at(1)

array.insert(1, mv2)
array.insert(5, mv1)
```


### create a new array with n elements, each with a default value of v (any immutable object)

```ruby
array = Array.new(4, true)
```

### "iterate through the array and print successive 'chunks' of n consecutive elements. Next print only the 2nd element in each chunk. Bonus: do so manually. No chunk may contain less than n elements."

```ruby
array = [1, 3, 4, 5, 7, 8]

array.each_cons(3) { |span| p span }

array.each_cons(3) { |a, b, c| p b }

# manually
array = [1, 3, 4, 5, 7, 8]
index = 0
elements = 3

while index + elements - 1 < array.length
  p array[index, elements] 
  # p array[index + 1]   # <- substitute this line for previous line for second part of question
  index += 1
end
```

### slice the array into groups of n elements and print each slice.  Bonus: do so manually. Final slice will contain < n elements if (elements.size % n != 0)

```ruby 
array = [1, 3, 4, 5, 7, 8, 9]

array.each_slice(2) { |slice| p slice }

# manually
array = [1, 3, 4, 5, 7, 8, 9]
index = 0
slice = 2

while index < array.length
  p array[index, slice]
  index += slice
end
```

### (array) iterate over array of numbers and print out each value; do the same in reverse.\nBonus: solve with iterators and then with manual loop)
```ruby
arr = [1, 2, 3, 4, 5]

arr.each { |number| p number }
# or
arr.each do |number|
  p number
end

# reverse manually

arr = (1..10).to_a

index = arr.index(arr.last)

while index >= 0
  p arr[index]
  index -= 1
end

# reverse with iterators

arr.reverse_each { |ele| p ele }
```

### (array) iterate over array of numbers and print out only those matching certain conditions
```ruby
arr = [1, 2, 3, 4, 5]

arr.each { |number| p number if number > 2.3 }


arr2 = ['R2D2', 'C3PO', 'BB8', 'K9', 'Data']

arr2.each { |droid| p droid if droid.include?('O') }


arr2 = ['R2D2', 'C3PO', 'BB8', 'K9', 'Data']

arr2.each do |droid|
  if droid.include?('O')
    p droid
  end
end
```


### (array) append n to end of array. Bonus: append `n`, `o`, `p` to end of array with one line',

```ruby
arr = [1, 2, 3, 4, 5]

arr.push 101
# or 
arr << 102

# bonus
arr.push(103, 104, 105)

# if one does not wish to modify the array...

arr3 = [103]

p arr + arr3
```


### (array) prepend n to beginning of array. Bonus: prepend `n`, `o`, `p` to start of array with one line',

```ruby
arr = [1, 2, 3, 4, 5]

arr.unshift 0
# or
arr.insert(0, -1)

# bonus
arr.unshift(10, 11, 12)
```


### (array) remove specified objects.  Bonus: remove (or keep) objects that meet given conditions

```ruby
arr = [1, 2, 3, 4, 5]

arr.delete(2)
# or
arr.delete_at(-1)

#Bonus
arr = [1, 2, 3, 4, 5]
arr.delete_if {|n| n > 4 }
arr.keep_if { |n| n < 3 }

```


### (array) remove objects at specified indices. Bonus: remove objects from an array using a range of indices

```ruby
arr = [1, 2, 3, 4, 5]

arr.delete_at(-1)

# or

arr.slice!(-1)

# Bonus

arr.slice!(1..3)
```


### (array) remove duplicates using one method; bonus: do so without invoking the presumptive method

```ruby
arr = [1, 2, 3, 4, 5, 5, 2, 1]

arr.uniq!

# Bonus

arr = [2, 5, 3, 2, 7, 8, 2, 5, 8] 
index = 0

until index == arr.length
  if arr.count(arr[index]) > 1
    arr.slice!(index)
  else
    index += 1
  end
end

p arr

# or
arr = [2, 5, 3, 2, 7, 8, 2, 5, 8] 

arr.each do |ele|
  arr.delete_at(arr.rindex(ele)) if arr.count(ele) > 1
end

# non-destructive

arr = [1, 2, 3, 1, 2, 4, 1, 4, 6, 3 ]
arr_uniq = []

arr.each do |n|
  arr_uniq.push(n) if !arr_uniq.include?(n) # or `unless arr_uniq.include?(n)
end

p arr_uniq
```


### (array) extract all odds (or evens, or match regex) into new array; Bonus: do so by writing an original method that takes a block

```ruby
arr = [1, 2, 3, 4, 5, 5, 2, 1]
new_arr = []

arr.each do |number|
  if number.odd?
    new_arr.push number
  end
end

# or

new_arr = arr.select { |number| number.even? }

# or

arr = ['apples', 'pears', 'bananas', 'plantains']
arr.select { |fruit| fruit.match(/pl/) }

# Bonus

array = [1, 2, 3, 4, 5]

def filter(arr)
  filtered = []
  arr.each do |n|
    filtered.push n if yield(n)
  end
  filtered
end

p filter(array) { |num| num > 2 }
```


### (array) increment all numbers by 1
```ruby
arr = [1, 2, 3, 4, 5, 5, 2, 1]

arr.map { |number| number + 1 }
# or
arr.map { |number| number.next }
# or
incremented_arr = []

arr.each do |number|
  incremented_arr.push number + 1
end

```


### (array) find sum of all numbers
```ruby
arr = [1, 2, 3, 4, 5]

total = 0
arr.each do |number|
  total += number
end

p total
# or 
arr = [1, 2, 67, 19]
total = 0
counter = 0

while counter <= arr.length - 1
  total += arr[counter]
  counter += 1
end
# or
arr = [1, 2, 67, 19]

arr.inject { |sum, number| sum += number }
```

### find the product of all numbers in an array

```ruby
arr = [1, 2, 3, 1, 2, 4, 1, 4, 6, 3 ]
arr.inject { |product, number| product *= number }

# or 

arr = [1, 2, 3, 1, 2, 4, 1, 4, 6, 3 ]

ind = 0
product = arr[0]
while ind < arr.length - 1
  product *=  arr[ind + 1]
  ind += 1
end

p product
```

### (array) find max / min value in array
```ruby
arr = [1, 3, 67, 34, 1001, 3, 2]

arr.max
arr.min
arr.sort[-1]
arr.sort[0]

```

### (array) find index of a specified element
```ruby
droids = ['R2D2', 'C3PO', 'BB8', 'K9', 'Data']

droids.index('C3PO')
```

### (array) find the index of the first element that matches a given block
```ruby
droids = ['R2D2', 'C3PO', 'BB8', 'K9', 'Data']

droids.index { |droid| droid.include?('C') }

```

###  (array) return number of times an element occurs within the array; Bonus: return the number of  elements fitting a given description (e.g. are > n)
```ruby
arr = [1, 3, 67, 34, 1001, 3, 2]

arr.count(3)

# or 

total = 0
arr.each { |number| total += 1 if number == 3 }
total

# Bonus:

arr.count { |n| n.odd? }


```

### (array) move element in array to new index using one line
```ruby
arr = [1, 3, 67, 34, 1001, 3, 2]

# to place at end
arr.push arr.delete_at(4)
# or 
arr.push(arr.shift)

# to control point of insertion

arr.insert(1, arr.delete_at(4))

```

### (array) return all indices of occurrences of a specified element

```ruby
arr = [2, 5, 3, 2, 7, 8, 2, 5] 
indices = []
counted = 5

arr.each_with_index { |n, index| indices.push(index) if n == counted }
p indices

# or 
arr = [2, 5, 3, 2, 7, 8, 2, 5] 
indices = []
counted = 5
index = 0

until index == arr.length
  if arr[index] == counted
    indices.push(index)
  end
  index += 1
end
p indices

```
### combine two arrays into one:  1) and return a new array, 2) by mutating original array. Subtract the elements of one component array from the combined array to return an original.

```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
addition = [ "Dino", "Other_Pet" ]

flintstones + addition

flintstones.concat(addition)

flintstones - addition
```

### remove the first element in an array\nBonus: remove the first n elements in an array

```ruby
arr = [1, 2, 3, 4, 5, 6]
arr.shift
# bonus
arr.shift(3)

```
### remove the last element in an array\nBonus: remove the last n elements in an array
```ruby
arr = [1, 2, 3, 4, 5, 6]
arr.pop
# bonus
arr.pop(3)
# or
arr.slice!(-3, 3)
# or
3.times {arr.delete_at(-1)}
```

### return the first element in an array\nBonus: return the first n elements in an array

```ruby
arr = [1, 2, 3, 1, 2, 4, 1, 4, 6, 3 ]
arr.first 

#or
arr[0]

#bonus
arr.first(3)

#or
arr[0, 3]
#or
arr.slice(0..2)
```

### return the last element in an array\nBonus: return the last n elements in an array

```ruby
arr = [1, 2, 3, 1, 2, 4, 1, 4, 6, 3 ]
arr.last 

#or
arr[-1]

#bonus
arr.last(3)

#or
arr[-3, 3]

```
### create a new empty hash with a non-nil default value.

```ruby
sample = Hash.new(0)

# or

sample = {}
sample.default=('non-nil')
```


### (hash) return value(s) of specified key(s)
```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange' }

hsh[:pear] # returns the value(s)
# or
hsh.values_at(:pear, :grape) # returns array containing the values
# or
hsh.fetch(:pear)
# or 
hsh.fetch_values(:pear, :grape) # returns array containing the values
```

### return the key for a given value
```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange' }

hsh.key('green')
```

### (hash) add key/value pair 
```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange' }

hsh[:berry] = 'blue'
# or
hsh.store(:potato, 'white')

```
### (hash) print out all keys
```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange' }

p hsh.keys
# or
hsh.each_key { |food| p food }
# or
hsh.each do |food, color|
  p food
end

```
### (hash) print out all values

```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange' }

p hsh.values
# or 
hsh.each_value { |color| p color }
# or
hsh.each do |food, color|
  p color
end
```

### (hash) print out all key/value pairs

```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange' }

hsh.each { |food, color| puts "a fresh #{food} is #{color}" }
# or
hsh.each { |pair| p pair }
# or
hsh.each_pair { |pair| p pair }
# or
for pair in hsh
  p pair
end
# or
keys = hsh.keys
idx = 0

while idx < keys.size
  key = keys[idx]
  p [ key, hsh[key] ]
  idx += 1
end
```


### (hash) print out all key/value pairs where value meets certain conditions

```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange', :potato => 'tan' }

hsh.each { |food, color| puts "#{fruit} is #{color}" if color.length > 3 }
 
 # or

hsh.each do |food, color|
  if color.length > 3
    p food.to_s + ' ' + color
  end
end

# or

p hsh.select { |food, color| color.include?('n') }
```

### (hash) find max / min key/value 

```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange', :potato => 'tan', :spinach => 'green' }

hsh.max # returns arr of key and value associated with max key
hsh.min # returns arr of key and values associated with min key
hsh.values.max # returns max value
hsh.values.min
hsh.keys.max
hsh.keys.min
```

### (hash) return new hash of pairs meeting certain criteria
```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange', :potato => 'tan'}

hsh.select { |food, color| food.to_s.include?('r') }

```

### (hash) delete all key/value pairs where value meets certain conditions

```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange', :potato => 'tan'}

hsh.delete_if { |food, color| color.length > 3 }
# or
hsh.keep_if { |food, color| food.to_s.include?('r') }
```

### combine two hashes into one

```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange', :potato => 'tan'}
other_hsh = { :apple => 'yellow' }

hsh.merge!(other_hsh)
```

### change the value stored under a given key
```ruby
hsh = {:grape => 'red', :pear => 'green', :carrot => 'orange', :potato => 'tan'}

hsh[:grape] = 'purple'
# or
hsh.store(:grape, 'purple')
```

### from an array of strings, create a hash of all elements meeting a given description (e.g., contain 'is', or are longer than 6 chars).  Make the indices the keys and the elements the values.

```ruby
arr = ["van", "boat", "plane", "van", "car", "bike", "van"]
hsh = {}
arr.each_with_index { |word, ind| hsh[ind] = word if word == 'van'}

# or 
result = {}
idx = 0

while idx < arr.size
  element = arr[idx]
  result[idx] = element if element =~ /^v/
  idx += 1
end
```

### manually iterate though a hash and print each value or key

```ruby
hsh = { :apple=>'red', :banana=>'yellow', :grape=>'green' }

keys = hsh.keys
keys.each { |k| p hsh[k]}
```

### return a key / value pair (if any) associated with a given key. Do so first as an array, then as a single pair hash.

```ruby
hsh = {:todos=>[1, 2, 4], :days=>["m", "t", "w"], :months=>["april", "may"]}

hsh.assoc(:todos)

hsh.select { |k, v| k == :todos }
```

### Return a key / value pair (if any) that is associated with a given value.  Do so first by returning an array, then by returning a single-pair hash.

```ruby
hsh = {:todos=>[1, 2, 4], :days=>["m", "t", "w"], :months=>["april", "may"]}

hsh.rassoc([1, 2, 4])

hsh.select { |k, v| v == [1, 2, 4] }
```
