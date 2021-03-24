<img src="https://pandas.pydata.org/static/img/pandas.svg" width=200px>

# pandas DataFrames
---

## Questions:
- How do I read in data from a file?
- How can I work with data in tabular format (tables)?
- How can I do basic descriptive statistics on tabular data?

## Learning Objectives:
- Select individual values from a Pandas dataframe
- Select entire rows or entire columns from a dataframe
- Select a subset of both rows and columns from a dataframe in a single operation
- Select a subset of a dataframe by a single Boolean criterion
- Obtain descriptive statistics for subsets of data within a table
- Use the split-apply-combine paradigm to work with data
---

## What is pandas?

Bad news first: there are no cute, black-and-white bears here. pandas (whose official name starts with a lower-case "p") is a Python *library* for working with data in a tabular format, such as is found in file formats like CSV, Microsoft Excel, and Google Sheets. Unlike Excel or Sheets, pandas is not a point-and click graphical interface for working with these files — everything is done through Python code. But compared to other formats for working with data that we have seen in this workshop, such as lists and dictionaries, pandas may seem more familiar, and it definitely lends itself more naturally to large data sets. Indeed, pandas' mission statement is, "...to be the fundamental high-level building block for doing practical, real world data analysis in Python". 

The primary units of pandas data storage you will work with are [DataFrames](https://pandas.pydata.org/pandas-docs/stable/getting_started/intro_tutorials/01_table_oriented.html#min-tut-01-tableoriented) (essentially, tables of data organized as rows and columns). DataFrames are actually collections of pandas *Series* objects, which can be thought of as individual rows or columns (or vectors, or 1D arrays). 

AMong the things that make pandas so attractive are the powerful interface to access individual records of the table, proper handling of missing values, and relational-databases operations between DataFrames.

Pandas is built on top of the [Numpy][numpy] library. Although we haven't discussed NumPy in this workshop, it is a powerful and widely used Python library for working with numerical data. However, it's worth noting for your future reference that most of the methods defined for Numpy Arrays also apply to Pandas Series/DataFrames.

## About Python Libraries

pandas is an example of a Python library. A **library** is a collection of files (called *modules*) that contains functions for use by other programs. Libraries provide ways of extending Python's functionality in different ways. They may also contain data values (e.g., numerical constants), entire sample data sets, and other things. A library's contents are supposed to be related, although there's no actual way to enforce that.

The Python [standard library][stdlib] is an extensive suite of modules that comes with Python itself. Many additional libraries are available; CoCalc has a large number of extra libraries already installed.

To use a library (once it's installed), we must import it using the `import` declaration, like this:

~~~python
import pandas
~~~

Once a library is imported, we can use functions and methods from it. But, for functions we have to tell Python that the function can be found in a particular library we imported. For example, pandas has a function to import data from CSV (comma-separated value) files, called `read_csv`. To run this command, we would need to type:

~~~python
pandas.read_csv()
~~~

Since some package names are long, and adding the name to every function can result in a lot of typing, Python also allows us to assign an *alias* — a shorter name — to a library when we import it. For example, the convention for pandas is to give it the alias `pd` like this:

~~~python
import pandas as pd
~~~

Then to read a CSV file we could use:

~~~python
pd.read_csv()
~~~

In the cell below, import pandas with the alias pd:


```python

```

## Importing data with pandas

As noted, we can read a CSV file and use it to create a pandas DataFrame, with the funciton `pd.read_csv()`. [CSV](https://en.wikipedia.org/wiki/Comma-separated_values) is a text format used for storing tabular data, in which each line of the file corresponds to a row in the table, and columns are separated with commas. Often the first row of a CSV file will be the *header*, containing labels for each column. 

The Gapminder data is in CSV format, so let's load in one of the Gapminder datasets with the command below. Note that when we read in a DataFrame, we need to assign it to a variable name so that we can reference it later. A convention when working with pandas is to call the DataFrame `df`. This works fine if you only have one DataFrame to work with, but if you are working with multiple DataFrames it is a good idea to give them more meaningful names.

~~~python
df = pd.read_csv('data/gapminder_gdp_europe.csv')
~~~


```python

```

We can view the contents of the DataFrame by simply typing its name and running the cell. Note that, unlike most of the examples we've used in previous lessons, we *don't* use the `print()` function. Although it works, the result is not nicely formatted the way the output is if we just use the name of the data frame.

That is, raun this command: `df`, not `print(df)` in the cell below.


```python

```

You'll see that the rows are numbered in boldface, starting with 0 as is the norm in Python. This boldfaced column is called the **index** of the DataFrame, and provides one way of access data by rows. Across the top, you'll see that the column labels are also in boldface. pandas is pretty smart about automatically detecting when the first row of a CSV file contains header information (column names).

## Accessing values in a DataFrame

One thing we often want to do is access a single cell in a DataFrame, or a range of cells. Each cell is uniquely defined by a combination of its row and column locations. 

### Numerical indexing using `.iloc[]`

pandas provides two ways of accessing cell locations. One is using the numerical positions in the DataFrame, using the convention of [row, column] — with [0, 0] being the top left cell in the DataFrame. This is done with the `.iloc[]` method. For example, to access the GDP value for Austria in 1952 — which is located in the second row, third column of our current DataFrame, we would use:

~~~python
df.iloc[1, 2]
~~~


```python

```

## Label-based indexing using `.loc[]`

The other way to access a location in a DataFrame is by its index and column *labels*, using the `.loc[]` method. As noted earlier, in the DataFrame we imported, the indexes are currently numbers, which were created automatically when we imported the data. The `.loc[]` method doesn't work with numerical indexes (that's what `iloc` is for), but in the data set we imported, the first column of this CSV file is actually meant to be its index: while all other columns are data values (GDP, in type float), the first column identifies the country with which each row of data is associated. 

pandas has a method for setting an index column, `.set_index()`, where the argument (in the parentheses) would be the name of the column to use as the index. So here we want to run:

~~~python
df = df.set_index('country')
~~~

**Note** that we need to assign the result of this operation back to `df` (using `df = `), otherwise the change will not actually modify `df`.

Alternatively, if we knew this information before loading in the data file, we could have included the argument `index_col=` in the `pd.read_csv()` command:

~~~python
df = pd.read_csv('data/gapminder_gdp_europe.csv', index_col='country')
~~~

In the cell below, use the `.set_index()` method to set the index of `df` to `country`, and then view the DataFrame again to .


```python

```

Now that we have defined the index, we can access the 1952 GDP value for Austria by its index and column names:

~~~python
df.loc['Austria', 'gdpPercap_1952']
~~~






```python

```

## Use `:` on its own to mean all columns or all rows.

Just like Python's usual slicing notation, that we've previously used for strings and lists, we can use `:` with `.iloc[]` or `.loc[]`, to specify a range in a DataFrame.

For example, to see the GDP of Albania for every year in the DataFrame, we would use:

~~~python
print(data.loc["Albania", :])
~~~


```python

```

Likewise, we could see the GDP for every country (row) in the year 1957 with:

~~~python
df.loc[:, 'gdpPercap_1957']
~~~

You can also just specify the row index; if you don't specify anything for the columns, pandas assumes you want all columns:

~~~python
df.loc["Albania"]
~~~


```python

```

However, since the syntax for `.iloc[]` and `.loc[]` is [rows, columns], you cannot omit a row index; you need to use `:` if you want all rows.

## Slicing works on DataFrames

Slicing using numerical indices works similarly for DataFrames as we previously saw for strings and lists, for example, the following code will print the third through fifth rows of the DataFrame, and the fifth through eighth columns (remember, Python indexing starts at 0, and slicing does not include the "end" index): 

~~~python
df.iloc[2:5, 4:8]
~~~


```python

```

The code below will print from the sixth to second-last row of the DataFrame, and from the ninth to the last column:

~~~python
df.iloc[5:-1, 8:]
~~~


```python

```

**Note** however, that when using label-based indexing with `.loc[]`, pandas' slicing behaviour is a bit different. Specifically, the output *includes* the last item in the range, whereas numerical indexing with `.iloc[]` does not. 

So, considering that the first three rows of the DataFrame correspond to the countries Albania, Austria, and Belgium, and that columns 6 and 7 are for the years 1982 and 1987 respectively, compare the output of:

~~~python
df.iloc[0:2, 6:7]
~~~


```python

```

With

~~~python
df.loc['Albania':'Belgium', 'gdpPercap_1982':'gdpPercap_1988']
~~~


```python

```

The "inclusive" label-based indexing with `.loc[]` is fairly intuitive, but it's important to remember that it works differently from numerical indexing.

## Use lists to select non-contiguous sections of a DataFrame

While slicing can be very useful, sometimes we might want to extract values that aren't next to each other in a DataFrame. For example, what if we only want values from two specific years (1992 and 2002), for Scandinavian countries (Denmark, Finland, Norway, and Sweden)? Nether these years nor countries are in adjacent columns/rows in the DataFrame. With `.loc[]`, we can use lists, rather than ranges separated by `:`, as selectors:

~~~python
df.loc[['Denmark', 'Finland', 'Norway', 'Sweden'], ['gdpPercap_1992', 'gdpPercap_2002']]
~~~


```python

```

We could also define those lists as variables, and pass the variables to `.loc[]`. This might be useful if you were going to use the lists more than once in a notebook:

~~~python
scand_countries = ['Denmark', 'Finland', 'Iceland', 'Norway', 'Sweden']
years = ['gdpPercap_1992', 'gdpPercap_2002']
df.loc[scand_countries, years]
~~~


```python

```

We can take this a step further, and assign the output of a `.loc[]` selection like this to a new variable name. This makes a copy of the selected data, stored in a new DataFrame (or Series, if we only select one row or column) with its own name. This allows us to later reference and use that selection. 

~~~python
scand_data = df.loc[scand_countries, years]
~~~


```python

```

## It's easy to do simple math and statistics in DataFrames

We prevoiusly learned about methods to get simple statistical values out of a Python list, like `.max()`, and `.min()`. pandas includes these and many more methods as well. For example, we can view the mean GDP for Italy across all years (columns) with:

~~~python
df.loc['Italy'].mean()
~~~


```python

```

Or the largest GDP in 1977 with:

~~~python
df.loc[:, 'gdpPercap_1977'].max()
~~~


```python

```

Another useful method is `.describe()`, which prints out a range of descriptive statistics for the range of data you specify. Without any slicing it provides information for each column:

~~~python
df.describe()
~~~


```python

```

### Mini-Exercise
In the cell below, use the `scand_countries` and `years` variables to view descriptive statistics for all Scandinavian countries in each year.


```python

```

## Evaluate cells based on conditions

pandas allows an easy way to identify values in a DataFrame that meet a certain condition, using operators like `<`, `>`, and `==`. For example, let's see which countries in a list had a GDP over 10,000 in 1962 and 1992. The result is reported in Booleans (True/False) for each cell.

~~~python
countries = ['France', 'Germany', 'Italy', 'Spain', 'United Kingdom']
df.loc[countries, ['gdpPercap_1962', 'gdpPercap_1992']] 10000
~~~


```python

```


```python
scand_data 30000
```

## Select values or NaN using a Boolean mask.

A DataFrame full of Booleans is sometimes called a *mask* because of how it can be used. A mask removes values that are not True, and replaces them with `NaN` — a special Python value representing "not a number". This can be useful because pandas ignores NaN values when doing computations. 

We create a mask by assigning the output of a conditional statement to a variable name:


~~~python
mask = scand_data 30000
~~~


```python

```

Then we can apply the mask to the DataFrame to get only the values that meet the criterion:

~~~python
scand_data[mask]
~~~


```python
scand_data[mask]
```

As an example of how this might be used, the steps above would now allow us to find the lowest GDP value in each year, that was above 30,000:

~~~python
scand_data[mask].min()
~~~


```python

```

## Split-Apply-Combine

A common task in data science is to split data into meaningful subgroups, apply an operation to each subgroup (e.g., compute the mean), and then combine the results into a single output, such as a table or a new DataFrame. This paradigm was famously [described by Hadley Wickham in a 2011 paper](http://dx.doi.org/10.18637/jss.v040.i01).

pandas provides methods and grouping operations that are very efficient (*vectorized*) for split-apply-combine operations. 

As an example, let's say that we wanted to compare the average GDP for different regions of Europe, divided as northern, southern, eastern, and western. To do this, we first have to create lists defining the countries belonging to each of these regions:

~~~poython
northern = ['Denmark', 'Finland', 'Iceland', 'Norway', 'Sweden']
southern = ['Greece', 'Italy', 'Portugal', 'Spain']
eastern = ['Albania', 'Bosnia and Herzegovina', 'Bulgaria', 'Croatia', 
            'Czech Republic', 'Hungary', 'Montenegro', 'Poland', 'Romania', 
            'Serbia', 'Slovak Republic', 'Slovenia']
western = ['Austria',  'Belgium', 'France', 'Germany', 'Ireland', 
            'Netherlands', 'Switzerland', 'United Kingdom']
~~~


```python
northern = ['Denmark', 'Finland', 'Iceland', 'Norway', 'Sweden']
southern = ['Greece', 'Italy', 'Portugal', 'Spain', 'Turkey']
eastern = ['Albania', 'Bosnia and Herzegovina', 'Bulgaria','Croatia', 'Czech Republic', 
           'Hungary', 'Montenegro', 'Poland',  'Romania', 'Serbia', 'Slovak Republic', 'Slovenia']
western = ['Austria',  'Belgium', 'France', 'Germany', 'Ireland', 'Netherlands', 'Switzerland', 'United Kingdom']
```

Next we can make a new column simply by using `.loc[]` with the rows specified by one of the lists we just defined, a column name that doesn't already exist (in this case, we'll call it "region"), then assigning a region label to that combination of rows and column. We need to do this separately for each region. Note that when we first create the new column ("region"), pandas fills it with NaN values in any rows that were not defined by the assignment. For example, in the code below, the first line will create the column "region", and fill it with "northern" for any row in the `northern` list, and `NaN` to every other row. 

~~~python
df.loc[northern, 'region'] = 'northern'
df.loc[southern, 'region'] = 'southern'
df.loc[eastern, 'region'] = 'eastern'
df.loc[western, 'region'] = 'western'
~~~


```python
df.loc[northern, 'region'] = 'northern'
df.loc[southern, 'region'] = 'southern'
df.loc[eastern, 'region'] = 'eastern'
df.loc[western, 'region'] = 'western'
```

### Split

Now we can use this "region" column to split the data into groups, using a pandas bethod called `.groupby()`

~~~python
grouped_countries = df.groupby('region')
~~~


```python

```

### Apply

Now that we have split the data, we can apply a function separately to each group. Here we'll compute the mean GDP for each region, for each year:

~~~python
mean_gdp_by_region = grouped_countries.mean()
~~~


```python

```

### Combine

In this example, the combine step actually occurred with the *apply* step above — the result is automatically combined into a table of mean values organized by region. But since our *apply* step saved the result to a variable, we can view the resulting table as the output of the *combine* step:

~~~python
mean_gdp_by_region
~~~


```python

```

### Chaining

In Python, **chaining** refers to combining a number of operations in one command, using a sequence of methods. We can perform the above split-apply-combine procedure in a single step as follows. Note that because we don't assign the output to a variable name, it is displayed as output but not saved.

~~~python
df.groupby('region').mean()
~~~


```python

```

---
# Exercises

## Selecting Individual Values

Write an expression to find the Per Capita GDP of Serbia in 2007.


```python
### BEGIN SOLUTION
print(df.loc['Serbia', 'gdpPercap_2007'])
### END SOLUTION
```

## Extent of Slicing

1.  Do the two statements below produce the same output?
2.  Based on this, what rule governs what is included (or not) in numerical slices and named slices in Pandas?

~~~python
print(df.iloc[0:2, 0:2])
print(df.loc['Albania':'Belgium', 'gdpPercap_1952':'gdpPercap_1962'])
~~~


```python

```

No, they do not produce the same output! The output of the first statement is:

~~~python
        gdpPercap_1952  gdpPercap_1957
country                                
Albania     1601.056136     1942.284244
Austria     6137.076492     8842.598030
~~~

The second statement gives:
~~~python
        gdpPercap_1952  gdpPercap_1957  gdpPercap_1962
country                                                
Albania     1601.056136     1942.284244     2312.888958
Austria     6137.076492     8842.598030    10750.721110
Belgium     8343.105127     9714.960623    10991.206760
~~~

Clearly, the second statement produces an additional column and an additional row compared to the first statement.  What conclusion can we draw? We see that a numerical slice, 0:2, *omits* the final index (i.e. index 2) in the range provided, while a named slice, `'gdpPercap_1952':'gdpPercap_1962'`, *includes* the final element.

## Reconstructing Data

Explain what each line in the following short program does:
what is in `first`, `second`, etc.?

~~~python
first = pd.read_csv('data/gapminder_all.csv', index_col='country')
second = first[first['continent'] == 'Americas']
third = second.drop('Puerto Rico')
fourth = third.drop('continent', axis = 1)
fourth.to_csv('result.csv')
~~~


```python

```

## Solution
Let's go through this piece of code line by line.
~~~python
first = pd.read_csv('data/gapminder_all.csv', index_col='country')
~~~

This line loads the dataset containing the GDP data from all countries into a dataframe called 
`first`. The `index_col='country'` parameter selects which column to use as the 
row labels in the dataframe.  
~~~python
second = first[first['continent'] == 'Americas']
~~~

This line makes a selection: only those rows of `first` for which the 'continent' column matches 'Americas' are extracted. Notice how the Boolean expression inside the brackets, `first['continent'] == 'Americas'`, is used to select only those rows where the expression is true. Try printing this expression! Can you print also its individual True/False elements? (hint: first assign the expression to a variable)
~~~python
third = second.drop('Puerto Rico')
~~~

As the syntax suggests, this line drops the row from `second` where the label is 'Puerto Rico'. The resulting dataframe `third` has one row less than the original dataframe `second`.
~~~python
fourth = third.drop('continent', axis = 1)
~~~

Again we apply the drop function, but in this case we are dropping not a row but a whole column. To accomplish this, we need to specify also the `axis` parameter (we want to drop the second column which has index 1).
~~~python
fourth.to_csv('result.csv')
~~~

The final step is to write the data that we have been working on to a csv file. Pandas makes this easy with the `to_csv()` function. The only required argument to the function is the filename. Note that the file will be written in the directory from which you started the Jupyter or Python session.

## Selecting Indices

Explain in simple terms what `idxmin` and `idxmax` do in the short program below.
When would you use these methods?

~~~python
data = pd.read_csv('data/gapminder_gdp_europe.csv', index_col='country')
print(data.idxmin())
print(data.idxmax())
~~~


```python

```

## Solution
For each column in `data`, `idxmin` will return the index value corresponding to each column's minimum;
`idxmax` will do accordingly the same for each column's maximum value.

You can use these functions whenever you want to get the row index of the minimum/maximum value and not the actual minimum/maximum value.

## Practice with Selection

From the previous exercise, the Gapminder GDP data for Europe should be loaded in as `data`. Using this DataFrame, write an expression to select each of the following:

- GDP per capita for all countries in 1982


```python
### BEGIN SOLUTION

data['gdpPercap_1982']

### END SOLUTION
```

- GDP per capita for Denmark for all years


```python
### BEGIN SOLUTION

data.loc['Denmark',:]

### END SOLUTION
```

- GDP per capita for all countries for years *after* 1985


```python
### BEGIN SOLUTION

data.loc[:,'gdpPercap_1985':]

# Pandas is smart enough to recognize the number at the end of the column label 
# and does not give you an error, although no column named `gdpPercap_1985` actually 
# exists. This is useful if new columns are added to the CSV file later.

### END SOLUTION
```

- GDP per capita for each country in 2007 as a multiple of GDP per capita for that country in 1952


```python
### BEGIN SOLUTION

data['gdpPercap_2007']/data['gdpPercap_1952']

### END SOLUTION
```

## Using the `dir` function to see available methods

Python includes a `dir` function that can be used to display all of the available methods (functions) that are built into a data object.  As an example, the  functions available for a [list data type]https://docs.python.org/3/tutorial/datastructures.html#more-on-lists) are:
~~~python
potatoes = ["Russet", "Norkota", "Yukon Gold", "Pontiac"]
dir(potatoes)
~~~

This command returns:
~~~python
['__add__',
...
'__subclasshook__',
 'append',
 'clear',
 'copy',
 'count',
'extend',
'index',
'insert',
'pop',
'remove',
'reverse',
'sort']
~~~

The double underscore functions can be ignored for now; functions that are not surrounded by double underscores are the *public interface* of the [list type](https://docs.python.org/3/tutorial/datastructures.html#more-on-lists). So, if you want to sort the list of potatoes, according to `dir` you should try,
~~~python
potatoes.sort()
~~~


```python

```

Assume Pandas has been imported and the Gapminder GDP data for Europe has been loaded as `data`.  Then, use `dir` to find the function that prints out the median per-capita GDP across all European countries for each year that information is available.  


```python
### BEGIN SOLUTION
data.median()
### END SOLUTION
```

## Interpretation

Poland's borders have been stable since 1945, but changed several times in the years before then. How would you handle this if you were creating a table of GDP per capita for Poland for the entire twentieth century?


```python

```

---
# Summary of Key Points:
- Use `DataFrame.iloc[..., ...]` to select values by integer location.
- Use `:` on its own to mean all columns or all rows.
- Select multiple columns or rows using `DataFrame.loc` and a named slice.
- Result of slicing can be used in further operations.
- Use comparisons to select data based on value.
- Select values or NaN using a Boolean mask.

---
This lesson is adapted from the [Software Carpentry](https://software-carpentry.org/lessons/) [Plotting and Programming in Python](http://swcarpentry.github.io/python-novice-gapminder/) workshop. 

Licensed under [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/) 2021 by Aaron J Newman
