#!/bin/csh

foreach f (`ls *.ipynb`)
    jupyter nbconvert $f --to 'markdown' 
    end
    
exit 0
#