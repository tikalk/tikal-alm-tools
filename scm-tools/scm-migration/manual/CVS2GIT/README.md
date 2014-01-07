![Tikal icon](http://tikalk.com/sites/all/themes/sasson/tikal/logo.png)
# CVS2GIT
**Notice:** The migration were tested OK only only on Mac OS, ubuntu & centos.

## CVS to GIT repository migration

The migration includes:

* users migration with details (full name and email address)
* GIT push to a remote repository including all branches and tags
* Remove of CVSROOT folder in the created repository
* Addition of provided .gitignore file to all branches and tags

For using the cvs2svn2git script, follow those instructions:

## cvs2svn2git script prerequisites

**Tool** | **Description** | **Ununtu installation** | **Centos installation**
------------ | ------------- | ------------ | ------------
**CVS** | In order to migrate from CVS the CVS CLI must be installed on the machine | sudo apt-get install cvs | sudo yum install cvs
**SVN** | Since the tool migrates in 2 steps - first cvs-to-svn and then svn-to-git - SVN CLU must be installed as well on the machine | sudo apt-get install subversion | sudo yum install subversion
**GIT** | IThe migration needs GIT CLI to be installed on the machine as well | sudo apt-get install git | sudo yum install git
**GIT-SVN** | For the migration from SVN to GIT the tool needs also the git-svn addition to the GIT CLI | sudo apt-get install git-svn | sudo yum install git-svn
**ANT** | The tool main script is written in ANT therefore it must be installed as well | sudo apt-get install ant | sudo yum install ant
**CVS2SVN** | The tool uses a well-known CVS-to-SVN migration tool | svn co --username=guest --password="" http://cvs2svn.tigris.org/svn/cvs2svn/trunk cvs2svn-trunk (for more details see [cvs2svn Documentation](http://cvs2svn.tigris.org/cvs2svn.html)) | same as for ubuntu
**TIKAL-ALM-TOOLS** | This tool should be downloaded to the machine as well using a common git clone command | git clone https://github.com/tikalk/tikal-alm-tools.git | same as for ubuntu
**Work temporary folder** | create an empty folder where which the tool will use, e.g. mkdir ~/temp |  | 
## cvs2svn2git script arguments
## cvs2svn2git script activation
