# `for` Loops

---

## Questions:
- How can I make a program do many things?

## Learning Objectives:
- Explain what for loops are normally used for.
- Trace the execution of a simple (unnested) loop and correctly state the values of variables in each iteration.
- Write for loops that use the Accumulator pattern to aggregate values.

---

## A `for` loop executes commands once for each value in a collection

*   Doing calculations on the values in a list one by one
    is as painful as working with `pressure_001`, `pressure_002`, etc.
*   A *for loop* tells Python to execute some statements once for each value in a list,
    a character string,
    or some other collection.
*   "for each thing in this group, do these operations"

~~~python
for number in [2, 3, 5]:
    print(number)
~~~




```python

```

*   This `for` loop is equivalent to:

~~~python
print(2)
print(3)
print(5)
~~~



*   And the `for` loop's output is:

~~~
2
3
5
~~~




```python

```

## A `for` loop is made up of a collection, a loop variable, and a body.

~~~python
for number in [2, 3, 5]:
    print(number)
~~~




```python

```

*   The collection, `[2, 3, 5]`, is what the loop is being run on.
*   The body, `print(number)`, specifies what to do for each value in the collection.
*   The loop variable, `number`, is what changes for each *iteration* of the loop.
    *   The "current thing".



## The first line of the `for` loop must end with a colon, and the body must be indented

*   The colon at the end of the first line signals the start of a *block* of statements.
*   Python uses indentation rather than `{}` or `begin`/`end` to show *nesting*.
    *   Any consistent indentation is legal, but almost everyone uses four spaces.

~~~python
for number in [2, 3, 5]:
    print(number)
~~~




```python

```

### Indentation is always meaningful in Python

~~~python
firstName = "Jon"
  lastName = "Smith"
~~~




```python

```

This error can be fixed by removing the extra spaces at the beginning of the second line.

## Loop variables can be called anything.

As with all variables, loop variables are:
*   Created on demand.
*   Meaningless: their names can be anything at all.

~~~python
for kitten in [2, 3, 5]:
    print(kitten)
~~~



```python

```

## The body of a loop can contain many statements.

~~~python
primes = [2, 3, 5]
for p in primes:
    squared = p ** 2
    cubed = p ** 3
    print(p, squared, cubed)
~~~




```python

```

## Use `range` to iterate over a sequence of numbers

*   The built-in function [`range`](https://docs.python.org/3/library/stdtypes.html#range) produces a sequence of numbers.
    *   *Not* a list: the numbers are produced on demand
        to make looping over large ranges more efficient.
*   `range(N)` is the numbers 0..N-1
    *   Exactly the legal indices of a list or character string of length N

~~~python
print('a range is not a list: range(0, 3)')
for number in range(0, 3):
    print(number)
~~~




```python

```

## The "accumulator" pattern turns many values into one

*   A common pattern in programs is to:
    1.  Initialize an *accumulator* variable to zero, the empty string, or the empty list.
    2.  Update the variable with values from a collection.

~~~python
# Sum the first 10 integers.
total = 0
for number in range(10):
   total = total + (number + 1)
print(total)
~~~




```python

```

*   Read `total = total + (number + 1)` as:
    *   Add 1 to the current value of the loop variable `number`.
    *   Add that to the current value of the accumulator variable `total`.
    *   Assign that to `total`, replacing the current value.
*   We have to add `number + 1` because `range` produces 0..9, not 1..10

## Classifying Errors

Is an indentation error a syntax error or a runtime error?

## Solution
An IndentationError is a syntax error. Programs with syntax errors cannot be started.
A program with a runtime error will start but an error will be thrown under certain conditions.


## Tracing Execution

Create a table showing the numbers of the lines that are executed when this program runs,
and the values of the variables after each line is executed.

~~~python
total = 0
for char in "tin":
    total = total + 1
~~~





## Reversing a String

Fill in the blanks in the program below so that it prints "nit"
(the reverse of the original character string "tin").

~~~python
original = "tin"
result = ____
for char in original:
 result = ____
print(result)
~~~


```python
### BEGIN SOLUTION
original = "tin"
result = ""

for char in original:
    result = char + result
    
print(result)

### END SOLUTION
```

    nit


## Practice Accumulating

Fill in the blanks in each of the programs below
to produce the indicated result.

~~~python
# Total length of the strings in the list: ["red", "green", "blue"] = 12
total = 0
for word in ["red", "green", "blue"]:
 ____ = ____ + len(word)
print(total)
~~~


```python
### BEGIN SOLUTION
total = 0
for word in ["red", "green", "blue"]:
    total = total + len(word)
print(total)
### END SOLUTION
```

    12


~~~python
# List of word lengths: ["red", "green", "blue"] = [3, 5, 4]
lengths = ____
for word in ["red", "green", "blue"]:
 lengths.____(____)
print(lengths)
~~~


```python
### BEGIN SOLUTION
lengths = []
for word in ["red", "green", "blue"]:
  lengths.append(len(word))
print(lengths)
### END SOLUTION
```

    [3, 5, 4]


```python

# Concatenate all words: ["red", "green", "blue"] = "redgreenblue"
words = ["red", "green", "blue"]
result = ____
for ____ in ____:
 ____
print(result)
```


```python
### BEGIN SOLUTION

words = ["red", "green", "blue"]
result = ""
for word in words:
  result = result + word
print(result)
### END SOLUTION
```

    redgreenblue


```python
# Create acronym: ["red", "green", "blue"] = "RGB"
# write all the code this time! :) 
```


```python
### BEGIN SOLUTION
acronym = ""
for word in ["red", "green", "blue"]:
  acronym = acronym + word[0].upper()
print(acronym)
### END SOLUTION
```

    RGB


## Cumulative Sum

Reorder and properly indent the lines of code below
so that they print a list with the cumulative sum of data.
The result should be `[1, 3, 5, 10]`.

~~~python
cumulative.append(sum)
for number in data:
cumulative = []
sum += number
sum = 0
print(cumulative)
data = [1,2,2,5]
~~~


```python
### BEGIN SOLUTION

sum = 0
data = [1,2,2,5]
cumulative = []
for number in data:
    sum += number
    cumulative.append(sum)
print(cumulative)
### END SOLUTION
```

    [1, 3, 5, 10]


## Identifying Variable Name Errors

1. Read the code below and try to identify what the errors are
*without* running it.
2. Run the code and read the error message.
What type of `NameError` do you think this is?
Is it a string with no quotes, a misspelled variable, or a
variable that should have been defined but was not?
3. Fix the error.
4. Repeat steps 2 and 3, until you have fixed all the errors.

~~~python
for number in range(10):
 # use a if the number is a multiple of 3, otherwise use b
 if (Number % 3) == 0:
     message = message + a
 else:
     message = message + "b"
print(message)
~~~


```python
### BEGIN SOLUTION

# Python variable names are case sensitive: `number` and `Number` refer to different variables.
# The variable `message` needs to be initialized as an empty string.
# We want to add the string `"a"` to `message`, not the undefined variable `a`.

message = ""
for number in range(10):
  # use a if the number is a multiple of 3, otherwise use b
  if (number % 3) == 0:
      message = message + "a"
  else:
      message = message + "b"
print(message)
### END SOLUTION
```

    abbabbabba


## Identifying Item Errors

1. Read the code below and try to identify what the errors are *without* running it.
1. Run the code, and read the error message. What type of error is it?
1. Fix the error.

~~~python
seasons = ['Spring', 'Summer', 'Fall', 'Winter']
print('My favorite season is ', seasons[4])
~~~


```python
### BEGIN SOLUTION

# This list has 4 elements and the index to access the last element in the list is `3`.

seasons = ['Spring', 'Summer', 'Fall', 'Winter']
print('My favorite season is ', seasons[3])
### END SOLUTION
```

    My favorite season is  Winter


## Key Points Summary:

- A *for loop* executes commands once for each value in a collection.
- A `for` loop is made up of a collection, a loop variable, and a body.
- The first line of the `for` loop must end with a colon, and the body must be indented.
- Indentation is always meaningful in Python.
- Loop variables can be called anything (but it is strongly advised to have a meaningful name to the looping variable).
- The body of a loop can contain many statements.
- Use `range` to iterate over a sequence of numbers.
- The Accumulator pattern turns many values into one.



---
This lesson is adapted from the [Software Carpentry](https://software-carpentry.org/lessons/) [Plotting and Programming in Python](http://swcarpentry.github.io/python-novice-gapminder/) workshop. 

Licensed under [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/) 2021 by [SURGE](https://github.com/surge-dalhousie)
