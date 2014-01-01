#!/bin/sh

# Arguments:
# $1 - cvs.repository.root - root of CVS repository local copy
# $2 - repository.name - repository name to migrate
# $3 - authors.file.path - path to authors-file (template file)

cvs_repository_root=$2
repository_name=$3
authors_file_path=$4

if [ "x$1" = "x" ] || [ "x$2" = "x" ] || [ "x$3" = "x" ]; then
  echo "usage:"
  echo "  createAuthorsFileTemplate.sh <cvs.repository.root> <repository.name> <authors.file.path>"
  echo "where:"
	echo " cvs.repository.root - root of CVS repository local copy"
	echo " repository.name - repository name to migrate"
	echo " authors.file.path - path to authors-file (template)"
  exit -1
fi

ant -buildfile cvs2svn2git.xml -Dcvs.repository.root=$cvs_repository_root -Drepository.name=$repository_name -Dauthors.file.path=$authors_file_path cvs2svn2git:build-draft-authors-file
