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

# TARGETING WHOLE WORDS
# `count` called on an array considers whole elements; it does not build a set of individual chars to match as with the string version
str.split.count('is')

# NB: to prevent potential problems with punctuation and to target only whole words
str.delete('^ A-Za-z').split.count('is')
# or 
str.scan(/\bis\b/).size

# or with manual counting
total = 0
str.split.each { |word| total += 1 if word == 'is' }
total

# TARGETING SUBSTRINGS (i.e. contiguous characters of a pattern, not necessarily a word)
str.scan('is').length 
```

Cf with JavaScript

```javascript
let str = 'So this is my string, is it?';


// TARGETING WHOLE WORDS
str.match(/\bis\b/g).length; // 2 

// TARGETING SUBSTRINGS
str.match(/is/g).length;  // 3
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

Compare with JS:
  
  JS strings are primatives, so they are immutable; the best one can do is to reassign a new string reflecting the required deletions in the original string.


```javascript
let str = 'HellO, how aRe you?';

// to remove char at idx 5:
let str = `${str.slice(0,5)}${str.slice(6)}`;  // 'HellO how aRe you?'

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
# mutation
str = 'Hey, it is Friday!'

str.prepend('!!')  # "!!Hey, it is Friday!"

# non-mutating reassignment
str_2 = 'hello'
str_2 = "!! #{str_2}"
```

```javascript
// Cf JavaScript: only reassignment will work; string primitives are immutable
let str = 'hello world';

str = `!! ${str} **`;
console.log(str);
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

// or with arrow function
let str = 'hello world';
let revStr = '';

str.split('').forEach(chr => revStr = `${chr}${revStr}`);
```

```ruby
# or to change in place
str = 'This is The string, is it not?'

index = 1
while index < str.length
  str_2.insert(0, str_2.slice!(index))
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
str.match(/[ao]/)  # return match object
```

```javascript
const str = 'this is a sample string';
const pattern = new RegExp(/is/);

// with regexp:
console.log(str.match(/is/g));  // returns array of matches, like Ruby string#scan
console.log(str.search(pattern)); // 2
console.log(pattern.test(str));   // true
// without:
console.log(str.includes('is'));                // true
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
```javascript
const str = '    hello world   ';
str.match(/[aeiou]/g);

// or
const str = '    hello world   ';
const matches = str.split("").filter(chr => { return chr.match(/[aieou]/) });
```

### return an array of words taken from a string that meet given conditions (may use regex).
```ruby
str = "Oh, what beautiful weather today!"
str.split.select {|word| word.length <= 6 }

#or 
str.scan(/\b\w{1,6}\b/)
```
Compare with Js:

```javascript
let str = 'Oh, what beautiful weather today!'
str.split(/ /).filter( w => w.length <= 6);

// or
str.match(/\b\w{1,6}\b/g);
```

### (string) return new string (or modify existing string) to have all characters lowercased
```ruby
string = 'This IS tHe tEST string'
string.downcase

# to mutate
string.downcase!
```

```javascript
const str = 'THIS IS A SAMPLE STRING';

str = str.toLowerCase();
// or

str = str.replace(/[A-Z]/g, ltr => ltr.toLowerCase() );
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

# or 3) taking optional arguments for removal:
module String_Mod
  def tighten(chars = nil)

    result = ""

    each_char do |ch|
      if (chars && chars.include?(ch)) || !chars
        result << ch unless result[-1] == ch
      else
        result << ch
      end
    end

    result
  end
end

class String
  include String_Mod
end

# or with regexp:
str.gsub(/(.)\1+/, '\1')
```

Compare with JS:
```javascript
const str = 'hello, there, howww, arrre you?'
str.replace(/(.)\1+/g, '$1');

// or
const str1= 'THISSSS IS AA!AA SAMPLE STRING';
const str2 = "HeLLo, H*w GoEEs iiit?";

const deDupe = (string, ...toRemove) => {
  let holder = '';

  for (let i = 0; i < string.length; i++) {
    const char = string[i];
    if (!(holder.endsWith(char) && toRemove.includes(char))) {
      holder += char;
    }
  }

  return holder;
}
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

Compare with JS:

```javascript
let arr = [1,2,3,4,5];

arr.find( (ele) => ele > 3);
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

# or with a method:
def swap(arr, idx1, idx2)
  holder = arr[idx1]
  arr[idx1] = arr[idx2]
  arr[idx2] = holder

  arr
end
```

Compare with JS: (decomposition/assignment syntax requires enclosing `[]`
```javascript
const swap = (array, idx1, idx2) => {
  [array[idx1], array[idx2]] = [array[idx2], array[idx1]];

  return array
};
```

### create a new array with n elements, each with a default value of v (any immutable object)

```ruby
array = Array.new(4, true)
```
Cf with JavaScript:
  - Array constructor takes a size arg, but no default value arg.

```javascript
// create new Array of given size:
let arr = new Array(7); // [<7 empty items>]
// create new Array from the empty but sized array:
let arr2 = Array.from(arr); // [undefined, undefined, ...]
// map to an immutable value
let result = arr2.map( ele => 0); // [0,0,0,...]

// another approach:
let arr = new Array(7);
let shallowCopy = Array.from(arr); // [undefined, undefined...]
// or the equivalent result:
let shallowCopy2 = [ ...arr ]; // [undefined, undefined...]
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

# without reliance on slicing magic, and yielding to a block
def chunk(array, size)
  idx = 0

  while (idx + size - 1) < array.size do
    slice = []
    (idx...idx + size).each { |i| slice << array[i] }
    yield(slice) if block_given?
    idx += 1
  end
end

chunk([1,2,3,4,5], 2) { |slice| p slice }
chunk([1,2,3,4,5], 3) { |slice| p slice }
chunk([1,2,3,4,5], 4) { |slice| p slice }

# with explicit block call required:
def each_cons(arr, chunk, &block)
  idx = 0

  while (idx + chunk) <= arr.size
    block.call(arr[idx...(idx + chunk)] )
    idx += 1
  end
end

array = [1,2,3,4,5,6,7,8,9,10]
each_cons(array, 2) { |slice| p slice }
each_cons(array, 3) { |slice| p slice }
each_cons(array, 4) { |slice| p slice }
each_cons(array, 10) { |slice| p slice }
```

Compare with JS, which has first-class functions:

```javascript
const eachCons = (array, size, callback) => {
  const offset = size - 1;

  for (let i = 0; (i + offset) < array.length ; i++) {
    let chunk = [];
    for (let j = i; j <= (i + offset); j++) {
      chunk.push(array[j]);
    }
    callback(chunk)
  }
};

eachCons([1,2,3,4,5,6,7,8], 0, (arr) => console.log(arr));
eachCons([1,2,3,4,5,6,7,8], 1, (arr) => console.log(arr));
eachCons([1,2,3,4,5,6,7,8], 3, (arr) => console.log(arr));
eachCons([1,2,3,4,5,6,7,8], 8, (arr) => console.log(arr));
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

Cf with JavaScript:

If a built-in mutating method is required, JS doesn't have a perfect match, but desired elements can be removed one at a time with `splice` and `indexOf`

```javascript
let arr = [1,2,3,4,4,5,10,100];
arr.splice(arr.indexOf(3), 1); // [3]
```

Assuming reassignment is allowed, `filter` will work to remove elements _that do not meet_ a given description; i.e. to keep those that do meet a description

```javascript
arr = arr.filter( ele => ele > 9 ); // [10, 100]
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

Cf with JavaScript:
```javascript
let arr = [1,2,3,4];
arr.splice(0, 1); // returns [1] and removes the element 1 (arr mutated)
                  // second arg is the count of items to remove
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

# non-destructive, O(N) Time, O(N) Space
def my_uniq(array)
  seen = {}

  array.select do |ele|
    !seen[ele] && (seen[ele] = true)
  end
end
```

Compare with JS non-destructive, O(N) Time, O(N) Space:
```javascript
const myUniq = (arr) => {
  const seen = {};
  return arr.filter( (ele) => {
    if (seen[ele] === undefined) {
      return seen[ele] = ele;
    }
  });
};
```

### (array) extract all elements meeting given conditions into new array; Bonus: do so by writing an original method that takes a block

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

# as an Array method with explicit block call:
class Array
  def selector(&block)
    results = []

    self.each do |ele|
      results << ele if block.call(ele)
    end

    results
  end
end

n2 = (1..100).to_a
p n2.selector { |n| n.odd? }
p n2.selector { |n| n.even? }
```

Cf with JavaScript:
```javascript
//`Array.prototype.filter` plays the same role as Ruby's `select`;
// Custom implementation below:

const myFilter = (arr, callback) => {
  const result = [];

  for (let ele of arr) {
    if (callback(ele)) result.push(ele);
  }

  return result;
};

let array = [1,2,2,2,2,3,4,5,6,7,7,7,8,3,3];
let evens = myFilter(array, (e) => e % 2 === 0);

// or as an addition to Array methods
Array.prototype.selector = function(callback) {
  let results = [];
  for (ele of this) {
    if ( callback(ele)) results.push(ele);
  }

  return results;
};

let numbers = [1,2,3,4,5,6,7];
let getOdds = (n) => (n % 2 !== 0);

console.log(numbers.selector(getOdds));
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


### (array) find sum of all numbers; Bonus: create a method to do so taking a block
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

# using a custom reduce method:
class Array
  def reducer(initial=0, &block)
    total = initial
    self.each do |n|
      total = block.call(total,n)
    end

    total
  end
end

numbers = [1,2,3,4,5]
numbers.reducer { |memo, num| memo + num }
```

Contrast with JS:

```javascript
// using the built-in
let arr = [1,2,3,4,5]

arr.reduce((memo, n) => memo + n)

// using a custom method
const reduce = (array, callback, collector=0) => {
  array.forEach( (ele) => {
    collector = callback(ele, collector);
  });

  return collector;
};

reduce([1,2,3,4,5,6,7,8], (e, c) => {return (e + c)});
reduce([1,2,3,4,5,6,7,8], (e, c) => {return (e * c)});
reduce([1,2,3,4,5,6,7,8], (e, c) => {return (e + c)}, 100);


// or with monkey patching:
Array.prototype.reduceIt = function(callback, accumulator = 0) {
  this.forEach( ele => { accumulator = callback(accumulator, ele) })

  return accumulator;
};

let numbers = [1,2,3,4,5,6,7,12,19];
let add = (acc, n) => (acc + n);

numbers.reduceIt(add);
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

### (array) find max / min value in array; Bonus: find max/min n values
```ruby
arr = [1, 3, 67, 34, 1001, 3, 2]

arr.max
arr.min
arr.sort[-1]
arr.sort[0]

# Bonus:
arr.max(2)
arr.min(2)

# homegrown with monkey patching:
class Array
  def max_val(n=1)
    values = self.clone
    max_queue = []

    while !values.empty? do
      value = values.pop

      while !max_queue.empty? && (max_queue.last > value) do
        values.push(max_queue.pop)
      end

        max_queue.push(value)
    end
  end
end
```

Cf with JavaScript:
```javascript
let arr = [1,2,5,6,4,2];
// max:
arr.sort( (a,b) => a - b)[arr.length - 1];
// min:
arr.sort( (a,b) => a - b)[0];

// Bonus:
// max 2:
arr.sort( (a,b) => a - b).slice(arr.length - 2);
// min 2:
arr.sort( (a,b) => a - b).slice(0, 2);
```

### (array) find index of a specified element
```ruby
droids = ['R2D2', 'C3PO', 'BB8', 'K9', 'C3PO', 'Data']

droids.index('C3PO')
# to return the index of the last element match:
droids.rindex('C3PO')
```

Cf with JavaScript:

```javascript

let driods = ['R2D2', 'C3PO', 'BB8', 'K9', 'C3PO', 'Data'];

droids.indexOf('C3PO');
// to return the index of the last element match:
droids.lastIndexOf('C3PO');
```

### (array) find the index of the first element that matches a given block
```ruby
droids = ['R2D2', 'C3PO', 'BB8', 'K9', 'Data']

droids.index { |droid| droid.include?('C') }
# also:
droids.find_index { |droid| droid.include?('C') }
```

Cf with Javascript:

```javascript
let droids = ['R2D2', 'C3PO', 'BB8', 'K9', 'Data'];

droids.findIndex( (droid) => droid.startsWith('C') );
```

###  (array) Return number of times an element occurs within the array; Bonus: return the number of  elements fitting a given description (e.g. are > n)

```ruby
arr = [1, 3, 67, 34, 1001, 3, 2]

arr.count(3)

# or 
arr.count { |n| n.odd? }

# custom method with block
def count_instances(arr)
  count = 0

  arr.each do |ele|
    count += 1 if yield(ele)
  end

  count
end

count_instances(array) { |e| e > 5 }
count_instances(array) { |e| e.eql?(4)}

# or if the block is necessary:
def my_count(arr, &block)
  count = 0
  arr.each do |n|
    count += 1 if block.call(n)
  end

  count
end
```

Compare with JS:

```javascript
// hard-coding the criterion
const countInstances = (arr, target) => {
  return arr.filter( (ele) => ele === target ).length;
};

// or with a callback to set criterion
const countInstances = (arr, callback) => {
  return arr.filter((ele) => callback(ele)).length;
};

countInstances(array, (ele => { return ele < 5 }));

// or as an addition to `Array.prototype`
Array.prototype.counter = function(callback) {
  let count = 0;

  for (ele of this) {
    if (callback(ele)) (count += 1); 
  }
  
  return count;
};

let numbers = [1,2,3,4,5,6,7];
let countOdds = (n) => (n % 2 === 1);

console.log(numbers.counter(countOdds));
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

# if idx of target is not known:
arr.insert(1, arr.delete_at(arr.find_index(3)))
```

Cf with JS:

```javascript
let arr = [2,4,3,1,2,3]
arr.splice(1,0, ...arr.splice(2,1));
// arr is [2,3,4,1,2,3]
// or if idx of target is not known:
arr.splice(1,0, ...arr.splice(arr.indexOf(3),1));
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

flintstones + addition       # non-mutating

[*array1, *array2]           # non-mutating: spreads contents of both arrays
                             # into a new array

flintstones.concat(addition) # mutating

flintstones - addition       # non-mutating
```
Compare with JS:
```javascript
let array = [1,2,3,4,5,6,7,8,3,3];
let array2 = ['a','b','c','d','e'];

let newArr = [...array, ...array2]; // non-mutating
typeof (array + array2);            // STRING!!! NB: unlike Ruby, `+` coerces arrays 
                                    // into string concatenation

array.push(...array2);  // mutates by adding 'spread out' elements from array2

// no subtraction method, but a custom approximation:
const removeElements = (original, toSubtract) => {
  return original.filter((ele) => !toSubtract.includes(ele));
};
// ^^ this will remove all occurrences of `toSubtract`'s elements from `original`
```

### remove the first element in an array\nBonus: remove the first n elements in an array

```ruby
arr = [1, 2, 3, 4, 5, 6]
arr.shift # 1
# bonus
arr.shift(3) # [2,3,4]
```

Cf with JavaScript: `shift` does not take arguments, but `splice` can be used instead

```javascript
let arr = [1,2,3,4,5,6,7];
let n = 2;

arr.shift();  // 1
arr;          // [2,3,4,5,6,7]

arr.splice(0, n); // [2,3]
arr;              // [4,5,6,7]

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

Cf with JavaScript: JS `pop` does not take arguments, but `splice` can be used instead

```javascript
let arr = [1,2,3,4,5,6,7];
let n = 3;

arr.pop(); //  7
arr;        // [1,2,3,4,5,6]

arr.splice(arr.length - n); // [4,5,6]
arr;        // [1,2,3]

// non-desctructive
let arr = [1,2,3,4,5,6,7];
let n = 3;

arr.slice(0, arr.length - n); // [1,2,3,4]
arr;                          // [1,2,3,4,5,6,7]
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

Compare with JS:

```javascript
let array = [1,2,3,4,5];

array[array.length - 1];

// bonus:
array.slice(array.length - 2);  // [4,5]
array.slice(array.length - 3);  // [3,4,5]
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
