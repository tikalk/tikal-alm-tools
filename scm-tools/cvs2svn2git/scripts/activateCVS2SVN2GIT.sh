#!/bin/sh

# Arguments:
# $1 - cvs2svn.tool.folder - root location of built cvs2svn tool - see: http://cvs2svn.tigris.org/
# $2 - cvs.repository.root - root of CVS repository local copy
# $3 - repository.name - repository name to migrate
# $4 - authors.file.path - path to authors-file
# $5 - git.remote.uri - URI of git repository for setting as remote origin and pushing the migrated CVS repository

cvs2svn_tool_folder=$1
cvs_repository_root=$2
repository_name=$3
authors_file_path=$4
git_remote_uri=$5

if [ "x$1" = "x" ] || [ "x$2" = "x" ] || [ "x$3" = "x" ] || [ "x$4" = "x" ] || [ "x$5" = "x" ]; then
  echo "usage:"
  echo "  activateCVS2SVN2GIT.sh <cvs2svn.tool.folder> <cvs.repository.root> <repository.name> <authors.file.path> <git.remote.uri>"
  echo "where:"
	echo " cvs2svn.tool.folder - cvs2svn tool root location - see: http://cvs2svn.tigris.org/"
	echo " cvs.repository.root - root of CVS repository local copy"
	echo " repository.name - repository name to migrate"
	echo " authors.file.path - path to authors-file"
	echo " git.remote.uri - URI of GIT repository for pushing the migrated CVS repository"
  exit -1
fi

ant -buildfile cvs2svn2git.xml -Dcvs2svn.tool.folder=$cvs2svn_tool_folder -Dcvs.repository.root=$cvs_repository_root -Drepository.name=$repository_name -Dauthors.file.path=$authors_file_path -Dgit.remote.uri=$git_remote_uri
