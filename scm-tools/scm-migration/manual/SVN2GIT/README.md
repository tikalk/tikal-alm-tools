![Tikal icon](http://tikalk.com/sites/all/themes/sasson/tikal/logo.png)
# SVN2GIT
**Notice:** The migration were tested only on Mac OS, ubuntu & centos.

## SVN-to-GIT repository migration

The migration includes:

* users migration with details (full name and email address)
* GIT push to a remote repository including all branches and tags
* Addition of provided .gitignore file to all branches and tags

For using the SVN2GIT script, follow those instructions:

## SVN-to-GIT script prerequisites

**Tool** | **Description** | **Installation**
------------ | ------------- | ------------
**SVN** | SVN CLU must be installed on the machine | Ubuntu:<br/>sudo apt-get install subversion | sudo yum install subversion
**GIT** | IThe migration needs GIT CLI to be installed on the machine as well | Ubuntu:<br/>sudo apt-get install git | sudo yum install git
**GIT-SVN** | For the migration from SVN to GIT the tool needs also the git-svn addition to the GIT CLI | Ubuntu:<br/>sudo apt-get install git-svn | sudo yum install git-svn
**ANT** | The tool main script is written in ANT therefore it must be installed as well | Ubuntu:<br/>sudo apt-get install ant | sudo yum install ant
**TIKAL-ALM-TOOLS** | This tool should be downloaded to the machine as well using a common git clone command | git clone https://github.com/tikalk/tikal-alm-tools.git
**Work temporary folder** | create an empty folder where which the tool will use |  E.g. mkdir ~/temp
**Authors file** | A text file containing all SVN users (in addition to scm-migration user), in the following format:<br/>*user* = *full name* <*email address*> - one line per user.<br/>Example:*<br/>scm-migration = scm-migration <scm-migration><br/>bill.gates = Bill Gates <bill.gates.microsoft.com>*.<br/>Note: you must include a line for all CVS user (even if not relevant anymore) otherwise the migration will fail | See: [Automatic creation of SVN authors file](https://github.com/tikalk/tikal-alm-tools/tree/master/scm-tools/scm-migration/manual/SVN2AUTHORS) 
**Remote GIT repository** | Depending on the GIT repository manager you're using (e.g. GitHub, GitLab, etc.) you should create an empty new repository (best to be named as the 'repository name' argument above)
**Template .gitignore file** | Depending on the code main language and/or environment you're using, you should create a .gitignore template file.<br/>There are template files located in [/tikal-alm-tools/scm-tools/scm-migration/templates/GitIgnore](https://github.com/tikalk/tikal-alm-tools/tree/master/scm-tools/scm-migration/templates/GitIgnore) that you can use| see: [gitignore(5) Manual Page](http://git-scm.com/docs/gitignore) for .gitignore format |
## SVN-to-GIT script arguments
**Argument** | **Description** | **Value example**
------------ | ------------- | ------------
**repository.name** | The name of the repository as in SVN and will be created in GIT | tikal-alm-tools
**authors.file.path** | Full path to authors file as described in the prerequisites section | /Users/scmMigration/authors-file.txt
**git.remote.uri** | URL of the matching GIT repository as describedin the prerequisites section | https://github.com/tikalk/tikal-alm-tools.git
**temp.root.folder** | Path to a temp folder were the tool will create a temporary work folder | /Users/scmMigration/temp
**gitignore.file.path** | Path to .gitignore template file that will be injected to the root of all branches and tags (can be an empty file) | /Users/scmMigration/java.gitignore
**svn.repository.url** | SVN repository URL | http://svnserver/cvsrepo/tikal-alm-tools

## SVN-to-GIT script activation
Once you're ready will all prerequisites and script arguments, you can activate the SVN2GIT script by running the [/tikal-alm-tools/scm-tools/scm-migration/scripts/scm-migration.xml](https://github.com/tikalk/tikal-alm-tools/blob/master/scm-tools/scm-migration/scripts/scm-migration.xml) ANT script in one of those methods:

1. **ant -file scm-migration.xml <*list of arguments*> scm-migration:svn2git:main**<br/>Where <*list of arguments*> is a list of **ALL** the above arguments with there values including leading -D prefix for each argument.<br/>Example:<br/>*ant -file scm-migration -Drepository.name=tikal-alm-tools ... -Dgitignore.file.path=/Users/scmMigration/java.gitignore scm-migration:svn2git:main*
2. **ant -file scm-migration.xml -propertyfile <*path to arguments properties file*> scm-migration:svn2git:main**<br/>Where <*path to arguments properties file*> is a path of a properties file that include lines for **ALL** the above arguments with there values.<br/>Example:<br/>*ant -file scm-migration -propertyfile ~/CVS2GIT.properties scm-migration:svn2git:main*
 

 
