#!/bin/bash

rm diffed.md
git diff --color-words --no-index _a.txt _b.txt | aha > diffed.md