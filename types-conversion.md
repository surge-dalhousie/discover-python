# Data Types and Conversion
---

## Questions:
- What kinds of data do programs store?
- How can I convert one type to another?

## Learning Objectives:
- Explain key differences between integers and floating point numbers.
- Explain key differences between numbers and character strings.
- Use built-in functions to convert between integers, floating point numbers, and strings.

---

## Every value has a type

*   Every value in a program has a specific type
*   Integer (`int`): represents positive or negative whole numbers like 3 or -512
*   Floating point number (`float`): represents real numbers like 3.14159 or -2.5
*   Character (`char`): single characters, for example "a", "j", "8", "("
    * Characters are written in either single quotes or double quotes (as long as they match)
    * Numerals placed in quotes will be treated as characters, not integers or floats
*   Character string (usually called "string", `str`): text
    *   Written in either single quotes or double quotes (as long as they match)
    *   The quote marks aren't printed when the string is displayed

## Use the built-in function `type` to find the type of a value

*   Use the built-in function `type` to find out what type a value has
*   Works on variables as well
    *   But remember: the *value* has the type; the *variable* is just a label

~~~python
print(type(52))
~~~


```python

```

~~~python
fitness = 'average'
print(type(fitness))
~~~



```python

```

## Types control what operations (or methods) can be performed on a given value

*   A value's type determines what the program can do to it. So we can perform subtraction on integers:

~~~python
print(5 - 3)
~~~


```python

```

But not on strings or characters:
~~~python
print('hello' - 'h')
~~~


```python

```

## You *can* use the `+` and `*` operators on strings

*   "Adding" character strings concatenates them; i.e., creates one long string by combinging the inputs in the order you specify

~~~python
full_name = 'Ahmed' + 'Walsh'
print(full_name)
~~~


```python

```

- To add spaces between strings that you concateate, you need to explicitly include whitespaces in quotes:

~~~python
full_name = 'Ahmed' + ' ' + 'Walsh'
print(full_name)
~~~


```python

```

*   Multiplying a character string by an integer _N_ creates a new string that consists of that character string repeated  _N_ times. (Since multiplication is repeated addition)

~~~python
separator = '=' * 10
print(separator)
~~~



```python

```

## Strings have a length (but numbers don't)

*   The built-in function `len` counts the number of characters in a string.

~~~python
print(len(full_name))
~~~


```python

```

*   But numbers don't have a length (not even zero).

~~~python
print(len(52))
~~~



```python

```

## Use an **index** to get a single character from a string.

*   The characters (individual letters, numbers, and so on) in a string are
    ordered. For example, the string `'AB'` is not the same as `'BA'`. Because of
    this ordering, we can treat the string as a list of characters.
*   Each position in the string (first, second, etc.) is given a number. This
    number is called an **index** or sometimes a subscript.
*   Indices are numbered from 0.
*   Use the position's index in square brackets to get the character at that
    position.
    
![an illustration of indexing](images/2_indexing.svg)

~~~python
atom_name = 'helium'
print(atom_name[0])
~~~


```python

```

## Use a **slice** to get a substring.

*   A part of a string is called a **substring**. A substring can be as short as a
    single character.
*   An item in a list is called an element. Whenever we treat a string as if it
    were a list, the string's elements are its individual characters.
*   A slice is a part of a string (or, more generally, any list-like thing).
*   We take a slice by using `[start:stop]`, where `start` is replaced with the
    index of the first element we want and `stop` is replaced with the index of
    the element just after the last element we want.
*   Mathematically, you might say that a slice selects `[start:stop)`.
*   The difference between `stop` and `start` is the slice's length.
*   Taking a slice does not change the contents of the original string. Instead,
    the slice is a copy of part of the original string.

~~~python
atom_name = 'sodium'
print(atom_name[0:3])
~~~




```python

```

## Use the built-in function `len` to find the length of a string.

~~~python
print(len('helium'))
~~~




```python

```

*   Nested functions are evaluated from the inside out,
     like in mathematics.

## Slicing numbers?

If you assign `a = 123`,
what happens if you try to get the second digit of `a` via `a[1]`?


```python

```

### Solution
Numbers are not strings or sequences and Python will raise an error if you try to perform an index operation on a number. In the  lesson on types and type conversion we will learn more about types and how to convert between different types. If you want the Nth digit of a number you can convert it into a string using the `str` built-in function and then perform an index operation on that string.

## Slicing practice

What does the following program print?

~~~python
atom_name = 'carbon'
print('atom_name[1:3] is:', atom_name[1:3])
~~~


```python

```

## Slicing concepts

```python
cell_name = 'neuron'
```

1.  What does `cell_name[1:5]` do?
1.  What does `cell_name[0:5]` do?
1.  What does `cell_name[0:6]` do?
2.  What does `cell_name[0:]` (without a value after the colon) do?
3.  What does `cell_name[:5]` (without a value before the colon) do?
4.  What does `cell_name[:]` (just a colon) do?
5.  What does `cell_name[1:-1]` do?
6.  What happens when you choose a `high` value which is out of range? (i.e., try `cell_name[1:15]`) 


```python

```

## You must convert numbers to strings or vice versa when operating on them

*   Cannot add numbers and strings.

~~~python
print(1 + '2')
~~~


```python

```

*   Not allowed because it's ambiguous: should `1 + '2'` be `3` or `'12'`?
*   Some types can be converted to other types by using the type name as a function:

~~~python
print(1 + int('2'))
~~~


```python

```

~~~python
print(str(1) + '2')
~~~


```python

```

## You can mix integers and floats freely in operations

*   Integers and floating-point numbers can be mixed in arithmetic.
    * Python 3 automatically converts integers to floats as needed. 
    * (Integer division in Python 2 will return an integer, the *floor* of the division.)

~~~python
print('half is', 1 / 2.0)
print('three squared is', 3.0 ** 2)
~~~


```python

```

---
# Exercises

## Fractions

What type of value is 3.4?
How can you find out?


```python
### BEGIN SOLUTION
print(type(3.4))
### END SOLUTION
```

    <class 'float'>


## Automatic Type Conversion

What type of value is 3.25 + 4?



```python
### BEGIN SOLUTION
result = 3.25 + 4
print(result, 'is', type(result))
### END SOLUTION
```

    7.25 is <class 'float'>


## Choose a Type

What type of value (integer, floating point number, or character string)
would you use to represent each of the following?  Try to come up with more than one good answer for each problem.  For example, in (1), when would counting days with a floating point variable make more sense than using an integer?  

1. Number of days since the start of the year.
2. Time elapsed from the start of the year until now in days.
3. Serial number of a piece of lab equipment.
4. A lab specimen's age
5. Current population of a city.
6. Average population of a city over time.

## Solution

The answers to the questions are:
1. Integer, since the number of days would lie between 1 and 365. Float would make sense if you were considering partial days (e.g., if it's noon then today would count as 0.5)
2. Floating point, since fractional days are required
3. Character string if serial number contains letters and numbers, otherwise integer if the serial number consists only of numerals
4. This will vary! How do you define a specimen's age? whole days since collection (integer)? date and time (string)?
5. Choose integer to represent population in units of individuals, or floating point to represent population as large aggregates (eg millions)
6. Floating point number, since an average is likely to have a fractional part.


## Division Types

In Python 3, the `//` operator performs integer (whole-number) floor division, the `/` operator performs floating-point
division, and the '%' (or *modulo*) operator calculates and returns the remainder from integer division:

~~~python
print('5 // 3:', 5//3)
~~~


```python

```

~~~python
print('5 / 3:', 5/3)
~~~


```python

```

~~~python
print('5 % 3:', 5%3)
~~~


```python

```

However in Python2 (and other languages), the `/` operator between two integer types perform a floor (`//`) division. To perform a float division, we have to convert one of the integers to float.

~~~python
print('5 // 3:', 1)
~~~


```python

```

~~~python
print('5 / 3:', 1 )
~~~


```python

```

~~~python
print('5 / float(3):', 1.6666667 )
~~~


```python

```

~~~python
print('float(5) / 3:', 1.6666667 )
~~~


```python

```

~~~python
print('float(5 / 3):', 1.0 )
~~~


```python

```

~~~python
print('5 % 3:', 2)
~~~


```python

```

## Division Challenge

If `num_subjects` is the number of subjects taking part in a study, and `num_per_survey` is the number that can take part in a single survey, write an expression that calculates the number of surveys needed to reach everyone once, and assign the result to `num_surveys`:


```python
num_subjects = 600
num_per_survey = 42

### BEGIN SOLUTION
num_surveys = (num_subjects - 1) // num_per_survey + 1
### END SOLUTION

print(num_subjects, 'subjects,', num_per_survey, 'per survey:', num_surveys)
```

    600 subjects, 42 per survey: 15


## Solution
We want the minimum number of surveys that reaches everyone once, which is
the rounded up value of `num_subjects/ num_per_survey`. This is 
equivalent to performing a floor division with `//` and adding 1. Before
the division we need to subtract 1 from the number of subjects to deal with 
the case where `num_subjects` is evenly divisible by `num_per_survey`.
~~~python
num_subjects = 600
num_per_survey = 42
num_surveys = (num_subjects - 1) // num_per_survey + 1

print(num_subjects, 'subjects,', num_per_survey, 'per survey:', num_surveys)
~~~


## Strings to Numbers

Where reasonable, `float()` will convert a string to a floating point number,
and `int()` will convert a floating point number to an integer:

~~~python
print("string to float:", float("3.4"))
print("float to int:", int(3.4))
~~~


```python

```

If the conversion doesn't make sense, however, an error message will occur

~~~python
print("string to float:", float("Hello world!"))
~~~


```python

```

Given this information, what do you expect the following program to do?

~~~python
print("fractional string to int:", int("3.4"))
~~~

- What does it actually do?

- Why do you think it does that?


```python

```

## Solution
What do you expect this program to do? It would not be so unreasonable to expect the Python 3 `int` command to
convert the string "3.4" to 3.4 and an additional type conversion to 3. After all, Python 3 performs a lot of other magic - isn't that part of its charm?

However, Python 3 throws an error. Why? To be consistent, possibly. If you ask Python to perform two consecutive
typecasts, you must convert it explicitly in code.

~~~python
int("3.4")
int(float("3.4"))
~~~


```python

```

## Arithmetic with Different Types

Given these variable definitions:
~~~python
a = 1.0
b = "1"
c = "1.1"
~~~

Which of the following will return the floating point number `2.0`?
Note: there may be more than one right answer.



1. `a + float(b)`
2. `float(b) + float(c)`
3. `a + int(c)`
4. `a + int(float(c))`
5. `int(a) + int(float(c))`
6. `2.0 * b`


```python

```

## Complex Numbers

 Complex numbers are common in physics and other fields, and are composed of a "real" part and an "imaginary" part. Python provides complex numbers, which are written as `1.0 + 2.0j`, with the real part before the `+` and the imaginary part after the plus, with the suffix `j`.
 
If `val` is a complex number, its real and imaginary parts can be accessed using *dot notation* as `val.real` and `val.imag`.

~~~python
complex = 6 + 2j
print(complex.real)
print(complex.imag)
~~~


```python

```

### Thought questions

(If you're new to imaginary numbers, you can skip this one!)

1.  Why do you think Python uses `j` instead of `i` for the imaginary part?
2.  What do you expect `1+2j + 3` to produce?
3.  What do you expect `4j` to be?  What about `4 j` or `4 + j`?


```python

```

## Solution

1. Standard mathematics treatments typically use `i` to denote an imaginary number. However, from media reports it
was an early convention established from electrical engineering that now presents a technically expensive area to
change. [Stack Overflow provides additional explanation and
discussion.](http://stackoverflow.com/questions/24812444/why-are-complex-numbers-in-python-denoted-with-j-instead-of-i)
2. `(4+2j)`
3. `4j`, `Syntax Error: invalid syntax`, in this case _j_ is considered a variable and this depends on if _j_ is defined and if so, its assigned value

---
## Summary of Key Points:
- Every value has a type
- Use the built-in function `type` to find the type of a value
- Types control what operations can be done on values
- Strings can be added and multiplied
- Strings have a length (but numbers don't)
- Use an index to get a single character from a string
- Use a slice to get a substring
- Use the built-in function `len` to find the length of a string
- Must convert numbers to strings or vice versa when operating on them
- Can mix integers and floats freely in operations

---
This lesson is adapted from the [Software Carpentry](https://software-carpentry.org/lessons/) [Plotting and Programming in Python](http://swcarpentry.github.io/python-novice-gapminder/) workshop. 

Licensed under [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/) 2021 by Aaron J Newman
