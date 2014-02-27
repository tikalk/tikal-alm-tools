![Tikal icon](http://tikalk.com/sites/all/themes/sasson/tikal/logo.png)
# BLACKOUT-SVN2GIT
**Notice:** The migration were tested only on Mac OS, ubuntu & centos.

## SVN-to-GIT (without history) repository migration

The migration includes:

* GIT push to a remote repository including all branches and tags
* Addition of provided .gitignore file to all listed branches and tags

For using the BLACKOUT-SVN2GIT script, follow those instructions:

## BLACKOUT-SVN2GIT script prerequisites

**Tool** | **Description** | **Installation**
------------ | ------------- | ------------
**SVN** | SVN CLI must be installed on the machine | Ubuntu:<br/>```sudo apt-get install subversion```<br/>Centos:<br/>```sudo yum install subversion```
**GIT** | IThe migration needs GIT CLI to be installed on the machine as well | Ubuntu:<br/>```sudo apt-get install git```<br/>Centos<br/>```sudo yum install git```
**GIT-SVN** | For the migration from SVN to GIT the tool needs also the git-svn addition to the GIT CLI | Ubuntu:<br/>```sudo apt-get install git-svn```<br/>Centos:<br/>```sudo yum install git-svn```
**ANT** | The tool main script is written in ANT therefore it must be installed as well | Ubuntu:<br/>```sudo apt-get install ant```<br/>Centos:<br/>```sudo yum install ant```
**TIKAL-ALM-TOOLS** | This tool should be downloaded to the machine as well using a common git clone command | ```git clone https://github.com/tikalk/tikal-alm-tools.git```
**Work temporary folder** | create an empty folder where which the tool will use |  E.g. ```mkdir ~/temp```
**Remote GIT repository** | Depending on the GIT repository manager you're using (e.g. GitHub, GitLab, etc.) you should create an empty new repository (best to be named as the 'repository name' argument above)
**Template .gitignore file** | Depending on the code main language and/or environment you're using, you should create a .gitignore template file.<br/>There are template files located in [/tikal-alm-tools/scm-tools/scm-migration/templates/GitIgnore](https://github.com/tikalk/tikal-alm-tools/tree/master/scm-tools/scm-migration/templates/GitIgnore) that you can use| see: [gitignore(5) Manual Page](http://git-scm.com/docs/gitignore) for .gitignore format |
**Branches list file** | create a text file with names of all branches you need to migrate. You can leave the file empty if no branches (but trunk) should be migrated
**Tags list file** | create a text file with names of all tags you need to migrate. You can leave the file empty if no tags should be migrated
## BLACKOUT-SVN2GIT script arguments
**Argument** | **Description** | **Value example**
------------ | ------------- | ------------
**repository.name** | The name of the repository as in SVN and will be created in GIT | tikal-alm-tools
**git.remote.uri** | URL of the matching GIT repository as describedin the prerequisites section. Leave this arugment as an empty text if you want to skip the 'git push' step at the end of the process. | https://github.com/tikalk/tikal-alm-tools.git
**temp.root.folder** | Path to a temp folder were the tool will create a temporary work folder | /Users/scmMigration/temp
**gitignore.file.path** | Path to .gitignore template file that will be injected to the root of all branches and tags (can be an empty file) | /Users/scmMigration/java.gitignore
**svn.repository.url** | SVN repository URL | http://scmserver/svnrepo/tikal-alm-tools
**branches.list.file** | Full path to branches-list file as described in the prerequisites section | /Users/scmMigration/branches.lst
**tags.list.file** | Full path to tags-list file as described in the prerequisites section | /Users/scmMigration/tags.lst
**branches.path** | Optional relative path of the branches root URL. Defaulted (if not set) to 'branches' | branches/developement
**tags.path** | Optional relative path of the tags root URL. Defaulted (if not set) to 'tags' | tags/release
## BLACKOUT-SVN2GIT script activation
Once you're ready will all prerequisites and script arguments, you can activate the BLACKOUT-SVN2GIT script by running the [/tikal-alm-tools/scm-tools/scm-migration/scripts/scm-migration.xml](https://github.com/tikalk/tikal-alm-tools/blob/master/scm-tools/scm-migration/scripts/scm-migration.xml) ANT script in one of those methods:

1. ```ant -file scm-migration.xml <list of arguments> scm-migration:blackout-svn2git:main```<br/>Where <*list of arguments*> is a list of **ALL** the above arguments with there values including leading -D prefix for each argument.<br/>Example:<br/>```ant -file scm-migration -Drepository.name=tikal-alm-tools ... -Dgitignore.file.path=/Users/scmMigration/java.gitignore scm-migration:blackout-svn2git:main```

2. ```ant -file scm-migration.xml -propertyfile <path to arguments properties file> scm-migration:blackout-svn2git:main*```<br/>Where <*path to arguments properties file*> is a path of a properties file that include lines for **ALL** the above arguments with there values.<br/>Example:<br/>```ant -file scm-migration -propertyfile ~/SVN2GIT.properties scm-migration:blackout-svn2git:main```
 

 
