![Tikal icon](http://tikalk.com/sites/all/themes/sasson/tikal/logo.png)
# SVN2AUTHORS
![Tikal icon](http://tikalk.com/sites/all/themes/sasson/tikal/logo.png)

## Automatic creation of SVN authors file

In order to perform the [SVN2GIT](https://github.com/tikalk/tikal-alm-tools/tree/master/scm-tools/scm-migration/manual/SVN2GIT) migration, you need to provide a text file which includes all SVN users with their full name and email addresses in the following format (one line per user):<br/>
```user = full name <email address>```<br/>Example:<br/>```scm-migration = scm-migration <scm-migration>```<br/>
```bill.gates = Bill Gates <bill.gates.microsoft.com>```<br/>

Please notice that:

* you must include a line for each SVN users
* each line must incude the username as in SVN but it is not a must that the full name or email adress will be provided - you can replace it with the username instead.

The SVN2AUTHORS script creates a text file with a line-per-user which you can then edit and replace the user name with the full name and email address.<br/>For example, the script creates this line automatically:<br/>```bill.gates = bill.gates <bill.gates>```<br/>so after it is being created you need to check your active directory and replace the full name and email address manually so it will becase:<br/>```bill.gates = Bill Gates <bill.gates.microsoft.com>```


For running the SVN2AUTHORS script, follow those instructions:

## SVN2AUTHORS script prerequisites

**Tool** | **Description** | **Installation**
------------ | ------------- | ------------
**SVN** | SVN CLI must be installed on the machine | Ubuntu:<br/>```sudo apt-get install subversion```<br/>Centos:<br/>```sudo yum install subversion```
**TIKAL-ALM-TOOLS** | This tool should be downloaded to the machine as well using a common git clone command | ```git clone https://github.com/tikalk/tikal-alm-tools.git```
## SVN2AUTHORS script arguments
**Argument** | **Description** | **Value example**
------------ | ------------- | ------------
**repository.name** | The name of the repository as in CVS | tikal-alm-tools
**authors.file.path** | Full path to authors file to be created | /Users/scmMigration/authors-file.txt
**svn.repository.url** | SVN repository URL | http://scmserver/svnrepo/tikal-alm-tools
## SVN2AUTHORS script activation
Once you're ready will all prerequisites and script arguments, you can activate the SVN2AUTHORS script by running the [/tikal-alm-tools/scm-tools/scm-migration/scripts/scm-migration.xml](https://github.com/tikalk/tikal-alm-tools/blob/master/scm-tools/scm-migration/scripts/scm-migration.xml) ANT script in one of those methods:

1. ```ant -file scm-migration.xml <*list of arguments*> scm-migration:build-draft-svn-authors-file```<br/>Where <*list of arguments*> is a list of **ALL** the above arguments with there values including leading -D prefix for each argument.<br/>Example:<br/>```ant -file scm-migration -Drepository.name=tikal-alm-tools ... -Dsvn.repository.url=http://scmserver/svnrepo/tikal-alm-tools scm-migration:build-draft-svn-authors-file```

2. ```ant -file scm-migration.xml -propertyfile <*path to arguments properties file*> scm-migration:build-draft-cvs-authors-file```<br/>Where <*path to arguments properties file*> is a path of a properties file that include lines for **ALL** the above arguments with there values.<br/>Example:<br/>```ant -file scm-migration -propertyfile ~/SVN2AUTHORS.properties scm-migration:build-draft-svn-authors-file```
 

 




