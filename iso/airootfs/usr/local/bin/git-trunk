#!/bin/bash
git checkout --orphan temp $1
git commit -m "Truncated history"
git rebase --onto temp $1 master
git branch -D temp
# The following 2 commands are optional - they keep your git repo in good shape.
git prune --progress # delete all the objects w/o references
git gc --aggressive # aggressively collect garbage; may take a lot of time on large repos
