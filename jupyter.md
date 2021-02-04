```{figure} images/jupyter_logo.svg
---
align: left
width: 65px
```
# Jupyter

[**Jupyter**](https://jupyter.org/) (pronounced like the planet, Jupiter) is a tool that was developed as an open-source project to allow users to run code in a type of file called a **notebook**. A notebook is a file that contains a set of cells. Each cell can contain code; clicking on a code cell and then hitting its "run" button will execute the code. Any results (including graphics, formatted tables, or raw text) will be printed out right below the cell that generated them. Each cell can each contain many lines of code (like small program files), and a notebook can have many cells, each with bits of code. Moreover, notebooks are files, meaning that the entire contents are saved together, and can be reopened and re-run later — making the process reproducible. Perhaps the greatest advantage of notebooks over files containing code, however, is that the output of each cell is saved when the notebook file is saved. This means that you can write code to perform a task, such as analyzing a dataset, and have the output right there with the commands that produced the output. Jupyter notebooks have revolutionized the practice of data science, and create an ideal environment for learning and communicating.

Another great feature of notebooks is that cells can contain either code, or text formatted in a simple language called [**Markdown**](https://daringfireball.net/projects/markdown/). This means that in between your code cells, you can write blocks of text, for example to annotate or, essentially, "tell the  story" of your data. Indeed, you could literally write a scientific manuscript in a Jupyter Notebook, with the advantage that it contained all of the reproducible code used to perform the analysis. We'll talk more about Markdown later.

Here's an example screenshot of a notebook file:

![](images/notebook_example.png)

Jupyter notebooks have a number of other great design features. For one, notebooks were designed to run through a web browser, which means that you can run, and store, your analyses on a remote server (e.g., one belonging to a lab or university), meaning that you don't have to worry about the storage, backups, or computational capabilities of the computer you're working on (I'm guessing for most of you, this is a not-super-powerful laptop). In fact, there are a number of online cloud services for running Jupyter notebooks that you can use for free, including [Google Collaboratory](https://colab.research.google.com/notebooks/intro.ipynb#recent=true), and [CoCalc](https://cocalc.com/). In the class we will use CoCalc.

Another great feature of notebooks is that they can run code in a wide range of different languages. Indeed, the name "jupyter" comes from the names of the three first programming languages it supported: Julia, Python, and R. There are now over 100 different languages supported in Jupyter notebooks! Typically though, a given notebook file only runs a single language, so you have to pick when you first create the file.

In this class, you will work extensively in Jupyter notebooks, and you will use them to complete and submit your assignments and projects, as well. There are lots of materials on the web to help you learn (or remember) how to use Jupyter notebooks, starting with their official website: [https://jupyter.org](https://jupyter.org). This course also provides tutorials on using Jupyter notebooks.
