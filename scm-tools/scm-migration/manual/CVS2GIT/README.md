![Tikal icon](http://tikalk.com/sites/all/themes/sasson/tikal/logo.png)
# CVS2GIT
**Notice:** The migration were tested only on Mac OS, ubuntu & centos.

## CVS-to-GIT repository migration

The migration includes:

* users migration with details (full name and email address)
* GIT push to a remote repository including all branches and tags
* Removal of CVSROOT folder in the created repository
* Addition of provided .gitignore file to all branches and tags

For using the CVS2GIT script, follow those instructions:

## CVS2GIT script prerequisites

**Tool** | **Description** | **Installation**
------------ | ------------- | ------------
**CVS** | In order to migrate from CVS the CVS CLI must be installed on the machine | Ubuntu:<br/>sudo apt-get install cvs | sudo yum install cvs
**SVN** | Since the tool migrates in 2 steps - first cvs-to-svn and then svn-to-git - SVN CLU must be installed as well on the machine | Ubuntu:<br/>sudo apt-get install subversion | sudo yum install subversion
**GIT** | IThe migration needs GIT CLI to be installed on the machine as well | Ubuntu:<br/>sudo apt-get install git | sudo yum install git
**GIT-SVN** | For the migration from SVN to GIT the tool needs also the git-svn addition to the GIT CLI | Ubuntu:<br/>sudo apt-get install git-svn | sudo yum install git-svn
**ANT** | The tool main script is written in ANT therefore it must be installed as well | Ubuntu:<br/>sudo apt-get install ant | sudo yum install ant
**CVS2SVN** | The tool uses a well-known CVS-to-SVN migration tool | svn co --username=guest --password="" http://cvs2svn.tigris.org/svn/cvs2svn/trunk cvs2svn-trunk (for more details see [cvs2svn Documentation](http://cvs2svn.tigris.org/cvs2svn.html))
**TIKAL-ALM-TOOLS** | This tool should be downloaded to the machine as well using a common git clone command | git clone https://github.com/tikalk/tikal-alm-tools.git
**Work temporary folder** | create an empty folder where which the tool will use |  E.g. mkdir ~/temp
**Authors file** | A text file containing all CVS users (in addition to scm-migration user), in the following format:<br/>*user* = *full name* <*email address*> - one line per user.<br/>Example:*<br/>scm-migration = scm-migration <scm-migration><br/>bill.gates = Bill Gates <bill.gates.microsoft.com>*.<br/>Note: you must include a line for all CVS users (even if not relevant anymore) otherwise the migration will fail | See: [Automatic creation of CVS authors file](https://github.com/tikalk/tikal-alm-tools/tree/master/scm-tools/scm-migration/manual/CVS2AUTHORS) 
**Remote GIT repository** | Depending on the GIT repository manager you're using (e.g. GitHub, GitLab, etc.) you should create an empty new repository (best to be named as the 'repository name' argument above)
**Template .gitignore file** | Depending on the code main language and/or environment you're using, you should create a .gitignore template file.<br/>There are template files located in [/tikal-alm-tools/scm-tools/scm-migration/templates/GitIgnore](https://github.com/tikalk/tikal-alm-tools/tree/master/scm-tools/scm-migration/templates/GitIgnore) that you can use| see: [gitignore(5) Manual Page](http://git-scm.com/docs/gitignore) for .gitignore format |
## CVS2GIT script arguments
**Argument** | **Description** | **Value example**
------------ | ------------- | ------------
**repository.name** | The name of the repository as in CVS and will be created in GIT | tikal-alm-tools
**authors.file.path** | Full path to authors file as described in the prerequisites section | /Users/scmMigration/authors-file.txt
**cvs.repository.root** | Path to the root of the CVS repository (can be a local copy of it and should not inlcude the specific repository name as set in the repository.name argument) | http://cvsserver/cvsrepo
**git.remote.uri** | URL of the matching GIT repository as describedin the prerequisites section | https://github.com/tikalk/tikal-alm-tools.git
**cvs2svn.tool.folder** | Path to the root folder of the downloaded cvs2svn tool as describedin the prerequisites section | /Users/scmMigration/cvs2svn-trunk
**temp.root.folder** | Path to a temp folder were the tool will create a temporary work folder | /Users/scmMigration/temp
**gitignore.file.path** | Path to .gitignore template file that will be injected to the root of all branches and tags (can be an empty file) | /Users/scmMigration/java.gitignore

## CVS2GIT script activation
Once you're ready will all prerequisites and script arguments, you can activate the CVS2GIT script by running the [/tikal-alm-tools/scm-tools/scm-migration/scripts/scm-migration.xml](https://github.com/tikalk/tikal-alm-tools/blob/master/scm-tools/scm-migration/scripts/scm-migration.xml) ANT script in one of those methods:

1. **ant -file scm-migration.xml <*list of arguments*> scm-migration:cvs2git:main**<br/>Where <*list of arguments*> is a list of **ALL** the above arguments with there values including leading -D prefix for each argument.<br/>Example:<br/>*ant -file scm-migration -Drepository.name=tikal-alm-tools ... -Dgitignore.file.path=/Users/scmMigration/java.gitignore scm-migration:cvs2git:main*
2. **ant -file scm-migration.xml -propertyfile <*path to arguments properties file*> scm-migration:cvs2git:main**<br/>Where <*path to arguments properties file*> is a path of a properties file that include lines for **ALL** the above arguments with there values.<br/>Example:<br/>*ant -file scm-migration -propertyfile ~/CVS2GIT.properties scm-migration:cvs2git:main*
 

 
