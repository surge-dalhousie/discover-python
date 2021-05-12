# Python Built-Ins

---
## Questions:
- How can I use built-in functions?
- How can I find out what they do?
- What kind of errors can occur in programs?

## Learning Objectives:
- Explain the purpose of functions
- Correctly call built-in Python functions
- Correctly nest calls to built-in functions
- Use help to display documentation for built-in functions
- Correctly describe situations in which SyntaxError and NameError occur

---

## Functions in Python
- **Functions** are, effectively, commands that you can run (execute) in Python.
- Python provides many built-in functions, such as `print()` and `len()`
- Later in this workshop, we will demonstrate how to write your own functions to perform specific tasks repeatedly. In this section, we will focus on understanding the basics of how functions work, and introduce a few new ones.

## A function may take zero or more **arguments**

An **argument** is a value passed into a function, inside parentheses. 
*   `len()` takes exactly one argument
*   `int()`, `str()`, and `float()` take one argument
*   `print` takes zero or more
    *   `print` with no arguments prints a blank line
*   We must always use parentheses when calling a function, even if they're empty, so that Python knows a function is being called

~~~python
print('before')
print()
print('after')
~~~


```python

```

## Every function **returns** something

*   Every function call produces some result
*   If the function doesn't have a useful result to return, it usually returns the special value `None`. `None` is a Python object that stands in anytime there is no value.
*   Somewhat counter-intuitively, `print()` returns `None`. The `print()` function prints its arguments directly to the output, but when we attempt to assign the result of `print()` to a variable, that variable ends up with a value of `None`:

~~~python
result = print('example')
print('result of print is', result)
~~~


```python

```

## Commonly-used built-in functions include `max`, `min`, and `round`.

*   Use `max()` to find the largest value of two or more values
*   Use `min()` to find the smallest
*   Both work on character strings as well as numbers
    *   "Larger" and "smaller" use (0-9, A-Z, a-z) to compare letters

~~~python
print(max(1, 2, 3))
print(min('a', 'A', '0'))
~~~


```python

```

## Functions may only work for certain (combinations of) arguments

`max()` and `min()` must be given at least two values to compare. They must also be given things that can meaningfully be compared.

See what happens when you run each of the following:
~~~python
print(max(999))
print(max(1, 'a'))
~~~


```python

```

## Functions may have default values for some arguments

`round()` will round off a floating-point number. By default, it rounds to zero decimal places:

~~~python
round(3.712)
~~~


```python

```

We can specify the number of decimal places we want by passing a second argument

~~~python
round(3.712, 1)
~~~


```python

```

## Errors

You can fix syntax errors by reading the source and runtime errors by tracing execution

### Python reports a *syntax* error when it can't understand the source of a program

Won't even try to run the program if it can't be parsed



Look more closely at this error message:

~~~python
print("hello world"
~~~


```python
print("hello world"
```


      File "<ipython-input-3-fe69f65f3ba9>", line 1
        print("hello world"
                           ^
    SyntaxError: unexpected EOF while parsing



*   The message indicates a problem on first line of the input ("line 1")
    *   In this case the "ipython-input" section of the file name tells us that we are working with input into IPython, the Python interpreter used by the Jupyter Notebook
*   The number after `ipython-input-` indicates the cell number that the error occurred in (the number in square brackets to the left of the cell). Note that cells are numbered based on the sequence they are *executed* in, not their order in the notebook. So if you execute the cell above again, this number will change.
*   Next is the problematic line of code, indicating the start of the problem with a `^` pointer
*   Finally, the type of error is provided on the last line

Here are some other exampels of syntax errors:

~~~python
# Forgot to close the quote marks around the string
name = 'Feng
~~~


```python

```

~~~python
# An extra '=' in the assignment
age = = 52
~~~


```python

```

### Python reports a *runtime* error when something goes wrong while a program is executing

~~~python
age = 53
remaining = 100 - aege # mis-spelled 'age'
~~~


```python
age = 53
remaining = 100 - aege # mis-spelled 'age'
```


    ---------------------------------------------------------------------------

    NameError                                 Traceback (most recent call last)

    <ipython-input-1-1214fb6c55fc> in <module>
          1 age = 53
    ----> 2 remaining = 100 - aege # mis-spelled 'age'
    

    NameError: name 'aege' is not defined


## Getting Help

### Use the built-in function `help` to get help for a function

Every built-in function has online documentation.

~~~python
help(round)
~~~


```python

```

### The Jupyter Notebook has two ways to get help

#### Option 1:
- Place the cursor near where the function is invoked in a cell (i.e., the function name or its parameters),
- Hold down `shift`, and press `tab`
- Do this several times to expand the information returned


```python
print('Get help by clicking the print command while in edit mode, and pressing shift-tab')
```

    Get help by clicking the print command while in edit mode, and pressing shift-tab


#### Option 2:
Type the function name in a cell with a question mark after it. Then run the cell


```python

```

### Putting *comments* in your own code

Anything appearing after a hash symbol `#` in a line of code is ignored by Python. These are called **comments**. This is a useful way to help yourself and other readers of your code understand what's going on.

~~~python
# This sentence isn't executed by Python
adjustment = 0.5   # Neither is this - anything after '#' is ignored
~~~


```python

```

---
## Exercises

## What Happens When

- Explain in simple terms the order of operations in the following program: when does the addition happen, when foes the subtraction happen, when is each function called, etc.
- What is the final value of `radiance`?

~~~python
radiance = 1.0
radiance = max(2.1, 2.0 + min(radiance, 1.1 * radiance - 0.5))
~~~


```python

```

## Solution
1. `1.1 * radiance = 1.1`
2. `1.1 - 0.5 = 0.6`
3. `min(radiance, 0.6) = 0.6`
4. `2.0 + 0.6 = 2.6`
5. `max(2.1, 2.6) = 2.6`

At the end, `radiance = 2.6`

## Spot the Difference

- Predict what each of the `print` statements in the program below will print
- Does `max(len(rich), poor)` run or produce an error message?  If it runs, does its result make any sense?

~~~python
easy_string = "abc"
print(max(easy_string))
rich = "gold"
poor = "tin"
print(max(rich, poor))
print(max(len(rich), len(poor)))
~~~


```python

```

## Solution

`max(len(rich), poor)` throws a TypeError. This turns into `max(4, 'tin')` and 
as we discussed earlier a string and integer cannot meaningfully be compared.

## Why Not?
Why don't `max` and `min` return `None` when they are given no arguments?

## Solution
`max` and `min` return TypeErrors in this case because the correct number of parameters
was not supplied. If it just returned `None`, the error would be much harder to trace as it
would likely be stored into a variable and used later in the program, only to likely throw
a runtime error.

---
## Summary of Key Points:
- Use comments to add documentation to programs
- A function may take zero or more arguments
- Commonly-used built-in functions include `max`, `min`, and `round`
- Functions may only work for certain (combinations of) arguments
- Functions may have default values for some arguments
- Use the built-in function `help` to get help for a function
- The Jupyter Notebook has two ways to get help
- Every function returns something
- Python reports a syntax error when it can't understand the source of a program
- Python reports a runtime error when something goes wrong while a program is executing
- Fix syntax errors by reading the source code, and runtime errors by tracing the program's execution

---
This lesson is adapted from the [Software Carpentry](https://software-carpentry.org/lessons/) [Plotting and Programming in Python](http://swcarpentry.github.io/python-novice-gapminder/) workshop. 

Licensed under [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/) 2021 by [SURGE](https://github.com/surge-dalhousie)
