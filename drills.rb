## changes
# - move questions to separate file (yaml?)


string_fluency = [
  'remove leading and trailing whitespace from a string',
  "return a portion of a string based on index / indices.",
  "return length of string\n bonus: return number of alphabetic characters --not spaces, punctuation-- in string",
  "return number of specified characters in string\n bonus: return number of specified characters without invoking `.count`",
  'return number of specified sub-strings ( or words) in string',
  'delete specified characters in string',
  'delete characters at specified indices in string',
  "return index of specified characters [may use regexp] in a string (first occurrance)\nBonus: return index of specified characters (next occurrence) by starting at given index \nDouble bonus: return index of next occurance of character without providing integer for start-from index",
  "return index of specified characters [may use regexp] (last occurrence);\nBonus: return index of specified characters (last occurrence) up to a given index as stop point.\nDouble bonus: return index of next-to-last occurrence of character without providing integer for stop-at index",
  "add specified characters to start of string\nBonus: do so n times using one line",
  "add specified characters to end of string\nBonus: do so n times using one line",
  'add / insert specified characters at specified indices in string',
  'insert specified word prior to (or after) given existing word (use one line)',
  'substitute given character(s) [may use regexp] for other(s) in a string',
  "reverse character order in string\nBonus: reverse without invoking `.reverse`\nDouble bonus: reverse order by iterating through string (i.e. without making the original string into an array)",
  'determine if given characters are present in string. use both regex and non-regex methods',
  'return array of characters matching a pattern [may use regexp]',
  'return an array of words taken from a string that meet given conditions',
  'return new string (or modify existing string) to have all characters lowercased',
  'return new string (or modify existing string) to have all characters uppercased',
  'return new string (or modify existing string) to have sentence case',
  'return new string (or modify existing string) to have all cases switched',
  "return a given string minus all punctuation and special characters.\nBonus: return an array of words in the string, minus all punctuation and special characters.",
  "swap the places of two characters in a string using one line; then reassign a slice of the string to new values. Bonus: swap places / reassign 'manually'."
]

array_fluency = [
  'create a new array with n elements, each with a default value of v (where v is an immutable object)',
  "swap the places of two elements in an array using one line; then reassign a slice of the array to new values. Bonus: swap places / reassign 'manually'.",
  "iterate through the array and print successive 'chunks' of n consecutive elements. Next, print only the 2nd element in each chunk.\nBonus: do so manually. no chunk may contain less than n elements.",
  "slice the array into groups of n elements and print each slice.\nBonus: do so manually. [Final slice will contain < n elements if (ele.size % n != 0)]",
  "iterate over array of numbers and print out each value; do the same in reverse.\nBonus: solve with iterators and then with manual loop)",
  'iterate over array of numbers and print out only those matching certain conditions',
  "append `n` to end of array\nBonus: append `n`, `o`, `p` to end of array with one line",
  "prepend `n` to beginning of array\nBonus: prepend `n`, `o`, `p` to start of array with one line",
  "remove specified objects from an array\nBonus: remove objects that meet given conditions",
  "remove objects from an array at specified indices.\nBonus: remove objects from an array using a range of indices",
  "remove duplicates from an array using one method\nBonus: remove duplicates by looping through the array, i.e. without invoking the presumptive method",
  "extract all elements meeting given conditions (e.g. odds/evens, match a regex pattern) from an array into new array.\nBonus: do so by writing an original method that takes a block",
  'increment all numbers in an array by 1',
  'find sum of all numbers in an array',
  'find the product of all numbers in an array',
  "find max / min value in an array.\nBonus: find the max / min n elements in array",
  'return the index of specified element (first occurance)',
  'return the index of the first object that matches a given block',
  "return number of times a given element occurs within the array\nBonus: return number of elements in array fitting a given description (e.g. are odd)",
  'move element in array to new index using one line',
  "combine two arrays into one: 1) and return a new array, 2) by mutating original array.\nBonus: subtract the elements of one component array from the combined array to return an original.",
  'return all indices of occurrences of a specified element',
  "remove the first element in an array\nBonus: remove the first n elements in an array",
  "remove the last element in an array\nBonus: remove the last n elements in an array",
  "return the first element in an array\nBonus: return the first n elements in an array",
  "return the last element in an array\nBonus: return the last n elements in an array"
  
]

hash_fluency = [
  'create a new empty hash with a default value not set to `nil`',
  'get value(s) of specified key(s)',
  'get the key for a given value',
  'add key/value pair',
  'print out all keys',
  'print out all values',
  'print out all key/value pairs',
  'print out all key/value pairs where value meets certain conditions',
  "return the max / min key / value.\nBonus: return the max / min n pairs / keys / values",
  'return new hash of pairs meeting certain criteria',
  'delete all key / value pairs where value meets certain conditions',
  'combine two hashes into one',
  'change the value stored under a given key',
  "from an array of strings, create a hash of all elements meeting a given description (e.g., contain `is`, or are longer than 6 chars).  Make the indices the keys and the elements the values.",
  'manually iterate though a hash and print each value or key'
]

range_fluency = [
  'Iterate though an inclusive range to print all capital / lowercase letters in the alphabet',
  'Iterate though an exclusive range to print all integers from 1 to 50',
  'Return the object that defines the beginning of a range',
  'Return the object that defines the end of a range',
  'Return the object with the maximum value in a range; return the n objects with maximum values in the range',
  'Return the object with the minimum value in a range; return the n objects with minimum values in the range',
  'Return an array containing each member of a range',
  'Return the number of members in a numeric range',
  'Iterate through a range and print every 2nd / 3rd / 4th member',
  'Iterate through a range and print only those that meet a given condition (e.g.: are odd, are capital letters)',
  'Return an array of the last n members of a range',
  'Return an array of the first n members of a range',
  'Determine if an object is a member of a range',
  'Determine if an object is between the start and stopping points of a range',
  'Create an array of elements from the range that meet given conditions'
]
small_programs = [
  "reverse an array without using the built-in reverse method; \nBonus: do so without sending elements to a holder array",
  'write a solution to FizzBuzz',
  'write a method that takes an array and returns an array of the same string values except with the vowels removed',
  'select elements out of the array if its index is a fibonacci number',
  'write a method to generate fibonacci numbers between 0 and a stop point',
  'write a method to determine if a word is a palindrome, without using the reverse method',
  'write a method that determines if there is a balanced number of parentheses; add check to ensure parentheses are in correct order',
  "write a search method that returns all elements in a hash matching a set of conditions\n e.g. food = {\ngrape: {color: 'red', cost: 75},\npear: {color: 'green', cost: 50},\ncarrot: {color: 'orange', cost: 100},\npotato: {color: 'tan', cost: 150}\n}\nsearch_or(food, 'red', 100) => {grape: {color: 'red', cost: 75}, carrot: {color: 'orange', cost: 100}}",
  'write a title case method that returns a string with title-appropriate capitalization',
  "write a method that takes a string and returns an array of the indices of single characters that match a pattern.\nBonus: do same with matches of multi-char strings",
  'write a method that takes an array and returns the indices of all elements meeting given criteria (e.g. odd)',
  'write a method that takes an array and an object to match, and returns the indices of all matches',
  'write a method to return all the factors of a number',
  'return the indices of duplicates in an array',
  'return the max and min values in a array without invoking `.max` or `.min`',
  'return the index of the nth occurrence of an element in an array',
  'reverse order of a string by iterating through string directly (i.e. without changing to an array or using a holder)',
  'write a method to sort an array',
  'write a method to determine if a number is prime.',
  'write a method to return all the prime numbers between a start and a stop point',
  'Write a method to turn an integer into an array of its digits.  Expand on this method to make a method to convert an integer into a string without using the standard conversion methods.'
]

basic_concepts = [
  'explain local variable scope (interaction with blocks and methods)',
  'how passing an object into a method can or cannot permanently change the object',
  'explain `.each`, `.map`, `.`select',
  'explain variables as pointers',
  'explain the distinctions between `puts` and `return`',
  'explain the difference between `false` and  `nil`',
  'implicit return value of methods and blocks'
]

menu_options = {1=>"string fluency", 2=>"array fluency", 3=>"hash fluency", 4=>"range fluency", 5=>"basic concepts", 6=>"small programs", 7=>"exit program"}

def random_question(type)
  type[rand(type.length)]
end

def prompt(text)
  puts ">> #{text}"
end

def display_menu(options)
  system 'clear' or system 'cls'
  prompt('Welcome to the Basic Ruby Fluency Quizzer.')
  puts ''
  prompt("Select one")
  puts '>>'
  options.each do |number, option|
    puts ">> >> (#{number}) #{option}"
  end
  puts '>>'
  print '>> '
end

def display_please_reenter
  prompt('That is not an option.  Please enter 1 - 7.')
  print '>> '
end
  

loop do
  display_menu(menu_options)
  choice = ''
  loop do
    choice = gets.chomp.to_i
    break if (1..7).include?(choice)
    display_please_reenter
  end
  break if choice == 7
  question_set = case choice
              when 1 then string_fluency
              when 2 then array_fluency
              when 3 then hash_fluency
              when 4 then range_fluency
              when 5 then basic_concepts
              when 6 then small_programs
              end

  loop do
    system 'clear' or system 'cls'
    5.times {puts ''}
    
    prompt(random_question(question_set))
    5.times {puts ''}
    
    prompt("[ENTER to continue, or type 'menu' to return to menu.]")
    print '>> '
    break if gets.chomp == 'menu'
  end
end
