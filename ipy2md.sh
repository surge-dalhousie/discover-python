#!/bin/csh

foreach f (`ls *.ipynb`)
    jupyter nbconvert $f --to 'markdown'
    end

git add *
git commit -m'rebuilt markdown version of files'
git push origin main
    
exit 0
#
