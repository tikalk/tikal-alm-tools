#!/bin/sh
export svn_repository_url=$1
export svn_authors_file=$2

svn log $svn_repository_url -q | awk -F '|' '/^r/ {sub("^ ", "", $2); sub(" $", "", $2); print $2" = "$2" <"$2">"}' | sort -u > $svn_authors_file
cat $svn_authors_file