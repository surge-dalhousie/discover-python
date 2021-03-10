# Lists
---


## Questions:
- How can I store multiple values?

## Learning Objectives:
- Explain why programs need collections of values.
- Write programs that create flat lists, index them, slice them, and modify them through assignment and method calls.
---

## A list stores many values in a single structure

*   Doing calculations with a hundred variables called `pressure_001`, `pressure_002`, etc.,
    would be at least as slow as doing them by hand
*   Use a *list* to store many values together
    *   Contained within square brackets `[...]`
    *   Values separated by commas `,`
*   Use `len` to find out how many values are in a list

~~~python
pressures = [0.273, 0.275, 0.277, 0.275, 0.276]
print('pressures:', pressures)
print('length:', len(pressures))
~~~


```python

```

## Lists may contain values of different types

*   A single list may contain numbers, strings, and anything else.

~~~python
goals = [1, 'Create lists.', 2, 'Extract items from lists.', 3, 'Modify lists.']
~~~


```python

```

## Use an item's index to fetch it from a list

Just like strings

~~~python
print('zeroth item of pressures:', pressures[0])
print('fourth item of pressures:', pressures[4])
~~~


```python

```

## Lists' values can be replaced by assigning to them

*   Use an index expression on the left of assignment to replace a value.

~~~python
pressures[0] = 0.265
print('pressures is now:', pressures)
~~~


```python

```

## Appending items to a list lengthens it

*   Use list_name`.append()` to add items to the end of a list.

~~~python
primes = [2, 3, 5]
print('primes is initially:', primes)
primes.append(7)
print('primes has become:', primes)
~~~


```python

```

## Methods
*   `append` is a *method* of lists.
    *   Methods are like functions, but tied to a particular object.
*   Use object_name`.method_name` to call methods.
*   We will meet other methods of lists as we go along.
    *   Use `help(list)` for a preview.
*   `extend` is similar to `append`, but it allows you to combine two lists.  For example:

~~~python
teen_primes = [11, 13, 17, 19]
middle_aged_primes = [37, 41, 43, 47]
print('primes is currently:', primes)
primes.extend(teen_primes)
print('primes has now become:', primes)
primes.append(middle_aged_primes)
print('primes has finally become:', primes)
~~~


```python

```

Note that while `extend` maintains the "flat" structure of the list, appending a list to a list makes the second (appended) list a single item in the first list. This is a consequence of the fact that lists can contain multiple types.

## Use `del` to remove items from a list entirely

*   We use `del list_name[index]` to remove an element from a list (in the example, 9 is not a prime number) and thus shorten it.
*   `del` is not a function or a method, but a *statement* in the language. That is why it is followed by a space, rather than providing arguments in parentheses.

~~~python
primes = [2, 3, 5, 7, 9]
print('primes before removing last item:', primes)
del primes[4]
print('primes after removing last item:', primes)
~~~


```python

```

## An empty list contains no values

*   Use `[]` on its own to represent a list that doesn't contain any values.
    *   "The zero of lists."
*   Helpful as a starting point for collecting values (which we will see later in this workshop)


```python

```

## Character strings can be indexed like lists.

Get single characters from a character string using indexes in square brackets:

~~~python
element = 'carbon'
print('zeroth character:', element[0])
print('third character:', element[3])
~~~


```python

```

## Character strings are immutable

*   Cannot change the characters in a string after it has been created.
    *   *Immutable*: can't be changed after creation.
    *   In contrast, lists are *mutable*: they can be modified in place.
*   Python considers the string to be a single value with parts,
    not a collection of values.

~~~python
element[0] = 'C'
~~~


```python

```

*   Lists and character strings are both *collections*.

## Indexing beyond the end of the collection is an error.

Python reports an `IndexError` if we attempt to access a value that doesn't exist.
*   This is a kind of runtime error, as discussed in the section on built-ins
*   Cannot be detected as the code is parsed because the index might be calculated based on data.

~~~python
print('99th element of element is:', element[99])
~~~

---
## Exercises 

## Fill in the Blanks

Fill in the blanks so that the program below produces the output shown.

~~~python
values = ____
values.____(1)
values.____(3)
values.____(5)
print('first time:', values)
values = values[____]
print('second time:', values)
~~~


```python
### BEGIN SOLUTION
values = []
values.append(1)
values.append(3)
values.append(5)
print('first time:', values)
values = values[1:]
print('second time:', values)
### END SOLUTION
```

    first time: [1, 3, 5]
    second time: [3, 5]



```python

```

## How Large is a Slice?

If 'low' and 'high' are both non-negative integers,
how long is the list `values[low:high]`?


```python

```

## Solution
The list `values[low:high]` has `high - low` elements.  For example,
`values[1:4]` has the 3 elements `values[1]`, `values[2]`, and `values[3]`.
Note that the expression will only work if `high` is less than the total
length of the list `values`.

## From Strings to Lists and Back

Given this:

~~~python
print('string to list:', list('tin'))
print('list to string:', ''.join(['g', 'o', 'l', 'd']))
~~~

~~~
string to list: ['t', 'i', 'n']
list to string: gold
~~~

1.  What does `list('some string')` do?
2.  What does `'-'.join(['x', 'y', 'z'])` generate?


```python

```

## Solution
1. [`list('some string')`](https://docs.python.org/3/library/stdtypes.html#list) converts a string into a list containing all of its characters.
2. [`join`](https://docs.python.org/3/library/stdtypes.html#str.join) returns a string that is the _concatenation_
   of each string element in the list and adds the separator between each element in the list. This results in
   `x-y-z`. The separator between the elements is the string that provides this method.

## Working With the End
What does the following program print?

~~~python
element = 'helium'
print(element[-1])
~~~

1.  How does Python interpret a negative index?
2.  If a list or string has N elements,
    what is the most negative index that can safely be used with it,
    and what location does that index represent?
3.  If `values` is a list, what does `del values[-1]` do?
4.  How can you display all elements but the last one without changing `values`?
    (Hint: you will need to combine slicing and negative indexing.)

## Solution
The program prints `m`.
1. Python interprets a negative index as starting from the end (as opposed to
   starting from the beginning).  The last element is `-1`.
2. The last index that can safely be used with a list of N elements is element
   `-N`, which represents the first element.
3. `del values[-1]` removes the last element from the list.
4. `values[:-1]`


## Stepping Through a List

What does the following program print?

~~~python
element = 'fluorine'
print(element[::2])
print(element[::-1])
~~~
1.  If we write a slice as `low:high:stride`, what does `stride` do?
2.  What expression would select all of the even-numbered items from a collection?


```python

```

## Solution
The program prints
~~~
furn
eniroulf
~~~

1. `stride` is the step size of the slice
2. The slice `1::2` selects all even-numbered items from a collection: it starts
   with element `1` (which is the second element, since indexing starts at `0`),
   goes on until the end (since no `end` is given), and uses a step size of `2`
   (i.e., selects every second element).
{: .solution}
{: .challenge}

## Slice Bounds

What does the following program print?

~~~python
element = 'lithium'
print(element[0:20])
print(element[-1:3])
~~~


```python

```

## Sort and Sorted

What do these two programs print?
In simple terms, explain the difference between `sorted(letters)` and `letters.sort()`.

~~~python
# Program A
letters = list('gold')
result = sorted(letters)
print('letters is', letters, 'and result is', result)
~~~


```python

```

~~~python
# Program B
letters = list('gold')
result = letters.sort()
print('letters is', letters, 'and result is', result)
~~~


```python

```

## Solution
Program A prints
~~~python
letters is ['g', 'o', 'l', 'd'] and result is ['d', 'g', 'l', 'o']
~~~

Program B prints
~~~python
letters is ['d', 'g', 'l', 'o'] and result is None
~~~

`sorted(letters)` returns a sorted copy of the list `letters` (the original
list `letters` remains unchanged), while `letters.sort()` sorts the list
`letters` in-place and does not return anything.


## Copying (or Not)

What do these two programs print?
In simple terms, explain the difference between `new = old` and `new = old[:]`.

~~~python
# Program A
old = list('gold')
new = old      # simple assignment
new[0] = 'D'
print('new is', new, 'and old is', old)
~~~


```python

```

~~~python
# Program B
old = list('gold')
new = old[:]   # assigning a slice
new[0] = 'D'
print('new is', new, 'and old is', old)
~~~


```python

```

## Solution
Program A prints
~~~
new is ['D', 'o', 'l', 'd'] and old is ['D', 'o', 'l', 'd']
~~~

Program B prints
~~~
new is ['D', 'o', 'l', 'd'] and old is ['g', 'o', 'l', 'd']
~~~

`new = old` makes `new` a reference to the list `old`; `new` and `old` point
towards the same object.

`new = old[:]` however creates a new list object `new` containing all elements
from the list `old`; `new` and `old` are different objects.




```python

```

## Last Character of a String

If Python starts counting from zero,
and `len` returns the number of characters in a string,
what index expression will get the last character in the string `name`?
(Note: we will see a simpler way to do this in a later episode.)


```python

```

## Solution

`name[len(name) - 1]`


## Summary of Key Points:
- A list stores many values in a single structure.
- Use an item's index to fetch it from a list.
- Lists' values can be replaced by assigning to them.
- Appending items to a list lengthens it.
- Use `del` to remove items from a list entirely.
- The empty list contains no values.
- Lists may contain values of different types.
- Character strings can be indexed like lists.
- Character strings are immutable.
- Indexing beyond the end of the collection is an error.

---
This lesson is adapted from the [Software Carpentry](https://software-carpentry.org/lessons/) [Plotting and Programming in Python](http://swcarpentry.github.io/python-novice-gapminder/) workshop. 

Licensed under [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/) 2021 by Aaron J Newman
