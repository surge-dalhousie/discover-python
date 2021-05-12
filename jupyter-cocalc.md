# Introduction to Jupyter Notebooks in CoCalc
---
## Questions
- How do I use CoCalc?
- How do I work with and navigate Jupyter notebooks in CoCalc?

## Learning Objectives
- be able to open a Jupyter notebook
- be able to navigate a Jupyter notebook
- be able to enter and run code in a Jupyter notebook
- be able to enter and format rich text in a Jupyter notebook, using Markdown

---

## Jupyter notebooks
You are currently viewing a Jupyter notebook file on CoCalc. Jupyter notebooks are composed of *cells*. Cells can be of three types: code, Markdown, or raw. This cell you're reading is Markdown, a simple language for formatting rich text. The cell below is a code cell, where you can write and run Python commands. Raw cells are "raw" text — they aren't fancy-formatted Markdown, and they aren't run-able as code. They also aren't terribly useful.

Cells have two modes: **edit** and **command**. Edit mode is indicated by a green border around the cell, while command mode has a blue border. In edit mode, you can type into the cell and edit it. In command mode, you can run the cell, or manipulate it in certain ways (e.g., deleting a whole cell, or moving it).

This text you are currently reading is a Markdown cell. If you are viewing it in CoCalc, and click once on this text, the cell should become active in command mode, so you should see a blue border around it. If you double-click on this (or any other Markdown) cell, the outline will turn green, the text will change to a *fixed-width* font and you'll see the Markdown formatting tags (like `#` for headings). Try it! Then hit Shift & Enter to execute the cell (which applies and renders the Markdown formatting).

So in summary:
- Single-clicking a cell will select it in Command mode
- Double-clicking a cell will put it in Edit mode
- Pressing the Shift & Enter keys on your keyboard simultaneously will execute a cell. Execution will format a Markdown cell, or run the code in a code cell. 

Below is a code cell with some very simple Python code. You haven't started learning Python yet, but as you can see, at its simplest Python can act like a calculator. Try executing the cell and see what happens.


```python
1 + 1
```

Take note of a couple of things here. Firstly, The text to the left of the cell changed from `In: []:` to `In [1]:` (or some number). "In" stands for "input", and the number indicates that the cell was run, and the numbers increase sequentially as you run cells. In general, it's a good idea to run Jupyter notebook cells sequentially, from top to bottom. But sometimes, when you're writing and debugging your code, you'll run them many times before you get it right, and sometimes you'll run a few cells and then go back and run them again. So the numbers are useful in keeping track of what you've done, in what order. If a process takes a while to run, then the cell will show `In: [*]:` while the cell is running. 

The outputs (`Out`) are numbered to match the inputs. The more important thing to know about the `Out[]:` output is that it  *only reflects the last output from the cell*. In the example above, that's ok, but check out what happens when you run the cell below:


```python
1 + 1
2 + 2
3 + 3
```

...you only see the output of the last line! This is normally not what you want. Thus in Jupyter if you want to see the output of commands you run in a cell, you should embed the command inside a `print()` statement, as shown below:


```python
print(1 + 1)
print(2 + 2)
print(3 + 3)
```

Soon in this workshop, you'll learn about data *types*. For now, it's worth noting that if you want to output text in Python, you need to put it inside quotation marks (Python doesn't care if you use single or double quotes, as long as you start and finish with the same one). So, running the cell below produces an error (do it!):


```python
print(Hello World)
```

But this works as desired:


```python
print("Hello world!")
```


```python
# Even in code cells, you can add random commentary that's not Python code 
# as long as you start each line with a hash mark, like this line is.

# These lines are called "comments" and it is good coding practice to use them.

# Comments allow you to make notes about your code. When you're starting out, you may want to add comments so that the next time you look at your code, you remember what a particular line or section does. Or, you may want to leave a "note to self" if you want to come back and add things to a particular section later.

# Although CoCalc "wraps" your comments to the width of the window, 
# not all programs do this. So it's good programming style to put in line breaks
# manually for your comments, like this.
```


```python
# Run this cell. We'll use it later.
x = 1
```

---

## A bit more about Jupyter notebooks

The top of this window probably looks a bit intimidating, with a lot of menus and buttons. You'll gradually get familiar with many of these functions, although some you may never use in this course. For now, we'll go through the most important functions and concepts.

### Working With Files

In general, when using CoCalc you don't need to explicitly save files. Notebooks are auto-saved so you don't have to worry about it! But there is a button to manually save between auto-saves.

Although for most of your work you will receive assignments with pre-made files to work in, for projects, for practice, or just for fun, you can create new files — including Jupyter notebooks but a variety of others as well. The `File > New` menu item will give you the options for different types of files you can create. All of your CoCalc files are associated with your account, and will last through the duration of the course — and even beyond! Your CoCalc account will not expire at the end of the course, although the paid upgrades to your account will. But you will still be able to use CoCalc and access your files after the course ends. The `File`menu also provides options for downloading your notebook files, including converting them from Jupyter notebooks to PDFs or other formats.

You can have multiple files open at once, and they appear as tabs at the top of the CoCalc window. In general, the tabs/files you have open will stay there even when you close your browser window/tab or log out, so the next time you connect to CoCalc you'll see those tabs still there. **HOWEVER** (and this is important), even if you leave your browser with the CoCalc window/tab open on your computer, CoCalc will "terminate" your running notebook after about 2 hours.

If you have multiple files open, normally they'll just appear as tabs across the top. However, over in the top right section of the window, you'll find these buttons:
![](images/frames.png) which allow you to divide the window into multiple "frames" and view multiple files at one time; each pane is itself sub-dividable into more frames!

**Pro tip:** Notebook files can get really long. CoCalc has a "Contents" button that will show you a table of contents for a notebook file. It makes this automatically from all the Markdown headings it finds. Find the Contents button above and click it to see.

### Running Kernels, and Items in Memory

This may seem contradictory: how is it that the file is still open, but the notebook is terminated? The answer lies in the fact that when you open a notebook file, you are _also_ starting a new Python **kernel** — a live, running instance of Python that will interpret your Python commands and produce output. Each notebook you open will start a new Python kernel. As long as the kernel is running, the things you do in Python will be stored in memory (RAM). This will make more sense as you start to use Python, but when you're running Python, you generally don't just run commands and get output. You also read data files into memory, and store the results of one command in memory for use in the next command. For example, a bit earlier in this notebook you were instructed to run a cell with the code:
`x = 1`

This *assigned* a value of `1` to a *variable* named `x`. This is now stored in RAM in side this notebooks kernel, so now in the cell below if you type
`print(x)` you will get the output `1`, because the variable `x` was stored in memory. 


```python

```

However, if the notebook's kernel terminates, then everything that was held in memory is erased. The next time you open or start to use the notebook, if you tried to run that `print(x)` command without running the cells above it, you would get an error, because `x` is no longer in memory. You would need to start at the top of the file and run all the commands again.

In general, this isn't a big deal. Python is very efficient, and for the most part we are working with reasonably small data sets so your code should not take long to run or re-run. It is important to understand this, though, because you will get confusing errors if you come back to your work after several hours, and try to just pick up where you left off.

If you're wondering why kernels are automatically terminated, it's because CoCalc runs on cloud servers. Every active kernel is consuming resources (computer hardware and energy) at a data centre somewhere. Terminating "idle" kernels saves CoCalc's operator money, as well as reducing the energy demands of the data centre.

You'll see at the top that there is a `Kernel` menu. That has a few options, including restarting a kernel manually (which will clear everything out of memory. You may want to do this sometimes as you're working, to get a fresh start rather than trying to un-do errors you made.), running all the cells in the notebook (an easy way to get back to where you left off, when your kernel terminated), and clearing all of the output in the notebook.

**Pro tip:** In general, it's a good idea to clear all output from a notebook when you restart the kernel, so you don't get confused between old and new outputs.

### Working in Notebooks

There is an **undo** function, which works similarly to other software you'll have used, sequentially undoing things you've typed in cells. **Importantly**, *the undo function does _not_ undo the results of commands you've run in Python*. Continuing with our previous example, this means that if you ran the Python command `x = 1`, then ran "undo", Jupyter would delete your typing, `x = 1`. However, in the kernel's memory, `x` would still equal `1`. So you could run `print(x)` the output would be `1`.

CoCalc also offers [Time Travel](https://doc.cocalc.com/time-travel.html#). This allows you to revert your notebook file to some specific, previous state. It's essentially like hitting "undo" a large (and very specific) number of times, without the risk of carpal tunnel syndrome. 

You can insert a new cell right below whatever cell is currently active, either by pressing the "+" button under the menu, or using the `Insert` menu, or As long as no cell is in edit mode) pressing the `b` key on the keyboard to insert a new cell *b*elow the selected cell (or `a` to insert a cell *a*bove the selected one). The `Cell` menu also has a variety of useful tools for working with cells, which are pretty self-explanatory if you look at them.

We encourage you to peruse the menus and randomly push buttons and try things in a notebook file. You will not break the internet (probably). Maybe first create a new notebook file first, though, and don't mess this one up!

### Help!

CoCalc has [extensive documentation](https://doc.cocalc.com/). You may want to read the [Cocalc Student Guide](https://doc.cocalc.com/teaching-students.html).

---
## Markdown

[**Markdown**](https://daringfireball.net/projects/markdown/) is a "plain text formatting syntax" and a tool for converting such plain text to a formatted version, such as [HTML](https://en.wikipedia.org/wiki/HTML) for display in a web page. There is a fundamental difference between plain text (.txt files) versus rich text (such as in Markdown, and also Microsoft Word or Google Docs). Rich text files display the text that you enter, and the formatting you choose (e.g., boldface), and hide the information telling your computer to make that text boldface "behind the scenes" in a complex file. In contrast, when you open a plain text file, what you see is literally the contents of that file, with nothing hiding in the background (except for a couple of hidden features, like markers for line breaks and tabs).

So a plain text file can never contain formatting like boldface or italic. Markdown allows you to create a text file with special codes that you type to "mark" certain text for formatting, and then run a program on that text file to produce a formatted output. For example, text surrounded by `*one asterisk*` shows up in *italics*; text surrounded by `**two asterisks**` shows up as **boldface**.

### Lists in Markdown
You can make a bulleted list by starting each line of the list with a hyphen (`-`) followed by a space:
- this is a first list item
- this is another list item

You can generate a numbered list by starting each line with a number, then a period, then a space. A nice feature is that if you start *every* item in your list with `1. `, Markdown will auto-number your items:
1. This is item 1
1. This is item 2, even though the Markdown starts with `1. `

### Different levels of headings
Different levels of headings can be indicated with hash marks; the more hash marks, the more deeply embedded a header is. So, the following:
- `# Heading 1` = first-level heading (like the title at the very top of this page)
- `## Heading 2` = second-level heading (like the title of the section titled 'Markdown')
- `### Heading 3` = third-level heading (heading of this section)
- etc.

While originally Markdown was designed to simplify creating web pages in HTML (the coding language for web pages), there are now a huge number of output formats available (e.g., PDF, Microsoft Word, ePub) in different applications, and many Markdown apps that allow you write and edit Markdown files while viewing a preview of the formatted output in another window alongside your Markdown text file.

HTML — and by extension, Markdown — embodies a design philosophy of separating the content of a document from its formatting. That is, when writing the content, you focus on writing, not how it's going to look, and then later, you apply formatting to make it look a certain way. This means that the same document can be formatted in virtually any possible way, with different fonts, sizes, etc.. It also provides consistency (e.g., you don't have to remember to manually make every first-level heading a specific larger font size, and bold) and makes it very easy to produce professional-looking output without professional web design skills.

[You can see a Markdown cheatsheet here](https://www.markdownguide.org/cheat-sheet/)

## Exercise

Create a cell below this one, convert it to Markdown, and use Markdown to do the following:
- your name, with your last name in bold
- a bulleted list of names of people in your family
- a second-level heading that reads "Education"
- a numbered list of educational attainments, including your high school diploma and any university degrees

Note: By default, new cells are code cells. Use the drop-down menu at the top (which will say "code") to change it to a Markdown cell.

## Summary
- CoCalc is a cloud platform for working with Jupyter notebooks
- You can edit and run code in Jupyter notebooks. Results will appear in the notebook
- Jupyter notebooks can contain a mixture of code, Markdown, and raw cells
- Each Jupyter notebook runs a kernel (e.g, Python) that maintains information in RAM as long as it is running
- Restarting the kernel will clear everything from RAM for that notebook
- Operations occur in the order that you run cells in a notebook - not necessarily the order the cells appear in the notebook. It's good practice to run cells in the order they appear in the notebook, and restart the kernel if you need to make changes and re-run
- Markdown is useful for annotating your code with rich text

---
Licensed under [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/) 2021 by [SURGE](https://github.com/surge-dalhousie)
