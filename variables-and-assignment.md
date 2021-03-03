# Variables and Assignment
---
## Questions
- How can I store data in programs?

## Learning Objectives
- Write programs that assign values to variables and perform calculations with those values.
- Correctly trace value changes in programs that use scalar assignment.

---

## Use variables to store values.

*   **Variables** are names for values.
*   In Python the `=` symbol **assigns** the value on the right to the name on the left.
*   The variable is created when a value is assigned to it.
*   Here, Python assigns an age to a variable `age`
    and a name in quotes to a variable `first_name`.

```python
    age = 42
    first_name = 'Ahmed'
```

*   Variable names
    * can **only** contain letters, digits, and underscore `_` (typically used to separate words in long variable names)
    * cannot start with a digit
    * are **case sensitive** (age, Age and AGE are three different variables)
*   Variable names that start with underscores like `__aarons_real_age` have a special meaning
    so we won't do that until we understand the convention.




```python

```

## Use `print` to display values.

*   Python has a built-in function called `print` that prints things as text.
*   Call the function (i.e., tell Python to run it) by using its name.
*   Provide values to the function (i.e., the things to print) in parentheses.
*   To add a string to the printout, wrap the string in single or double quotes.
*   The values passed to the function are called **arguments**

```python
print(first_name, 'is', age, 'years old')
```

*   `print` automatically puts a single space between items to separate them.
*   And wraps around to a new line at the end.




```python

```

## Variables must be created before they are used.

*   If a variable doesn't exist yet, or if the name has been mis-spelled,
    Python reports an error. (Unlike some languages, which "guess" a default value.)

```python
print(last_name)
```


```python

```

*   The last line of an error message is usually the most informative.
*   We will look at error messages in detail later.

## Variables persist between cells

Be aware that it is the *order of execution* of cells that is important in a Jupyter notebook, not the order in which they appear. Python will remember *all* the code that was run previously, including any variables you have defined, irrespective of the order in the notebook. Therefore if you define variables lower down the notebook and then (re)run cells further up, those defined further down will still be present. As an example, create two cells with the following content, in this order:

```python
print(myval)
myval = 1
```


```python

```


```python

```

If you execute this in order, the first cell will give an error. However, if you run the first cell *after* the second cell it will print out `1`. 

To prevent confusion, it can be helpful to use the `Kernel` -`Restart & Run All` menu option which clears the interpreter and runs everything from a clean slate going top to bottom.

## Variables can be used in calculations.

*   We can use variables in calculations just as if they were values.
    *   Remember, we assigned the value `42` to `age` a few lines ago.

```python
age = age + 3
print('Age in three years:', age)
```


```python

```

## Python is case-sensitive.

*   Python thinks that upper- and lower-case letters are different,
    so `Name` and `name` are different variables.
*   There are conventions for using upper-case letters at the start of variable names— they should only be used in specific circumstances in Python —  so **it is good practice to only use lower-case letters for variable names**


## Use meaningful variable names.

*   Python doesn't care what you call variables as long as they obey the rules
    (alphanumeric characters and the underscore).

~~~python
flabadab = 42
ewr_422_yY = 'Ahmed'
print(ewr_422_yY, 'is', flabadab, 'years old')
~~~


```python

```

*   However, if you use meaningful variable names, you help other people (and your future self!) understand what the program does

---
# Exercises

Exercises in this workshop are tasks that we encourage you to work on , on your own. We'll give you some time to work on them and then check in and discuss.

## What's in a name?

Which is a better variable name, m, min, or minutes? Why? Hint: think about which code you would rather inherit from someone who is leaving the lab:
```python
ts = m * 60 + s
tot_sec = min * 60 + sec
total_seconds = minutes * 60 + seconds
```

## Variables only change value when something is assigned to them

*   If we make one cell in a spreadsheet depend on another, and update the latter, the former updates automatically
*   This does **not** happen in programming languages

~~~python
first = 1
second = 5 * first
first = 2
print('first is', first, 'and second is', second)
~~~


```python

```

*   The computer reads the value of `first` when doing the multiplication,
    creates a new value, and assigns it to `second`.
*   After that, `second` does not remember where it came from.

## Swapping Values

Try to follow what happens in the following sequence of commands. Guess what the final values of `x` and `y` will be, then run the code yourself to check your guess.

~~~python
x = 1.0   
y = 3.0    
swap = x  
x = y      
y = swap 
~~~


```python

```

These three lines exchange the values in `x` and `y` using the `swap`
variable for temporary storage. This is a fairly common programming idiom.


---
## Key Points Summary:
- Use variables to store values
- Use `print` to display values
- Variables persist between cells
- Variables must be created before they are used
- Variables can be used in calculations
- Python is case-sensitive
- Variables only change value when something is assigned to them
- Use meaningful variable names

---
This lesson is adapted from the [Software Carpentry](https://software-carpentry.org/lessons/) [Plotting and Programming in Python](http://swcarpentry.github.io/python-novice-gapminder/) workshop. 

Licensed under [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/) 2021 by Aaron J Newman
