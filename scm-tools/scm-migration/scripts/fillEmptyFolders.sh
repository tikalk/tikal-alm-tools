#!/bin/sh
find . -type d -empty -exec touch {}/.gitignore \;
