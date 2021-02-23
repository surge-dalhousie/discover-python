# pandas DataFrames


```python

```

## FROM ANOTHER VIGNETTE - FIGURE OUT HOW TO INTEGRATE HERE
This function would typically be used within a `for` loop, but Pandas has
a different, more efficient way of doing the same thing, and that is by
*applying* a function to a dataframe or a portion of a dataframe.  Here
is an example, using the definition above.

~~~python
data = pd.read_csv('Americas-data.csv')
data['life_qrtl'] = data['lifeExp'].apply(calculate_life_quartile)
~~~

There is a lot in that second line, so let's take it piece by piece. On the right side of the `=` we start with `data['lifeExp']`, which is the column in the dataframe called `data` labeled `lifExp`.  We use the  `apply()` to do what it says, apply the `calculate_life_quartile` to the value of this column for every row in the dataframe.



```python

```

---
This lesson is adapted from the [Software Carpentry](https://software-carpentry.org/lessons/) [Plotting and Programming in Python](http://swcarpentry.github.io/python-novice-gapminder/) workshop. 

Licensed under [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/) 2021 by Aaron J Newman
